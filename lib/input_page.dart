import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_contents.dart';
import 'card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bmi_calculator.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  InputPageState createState() => InputPageState();
}

enum Gender { male, female, none }

class Variable {
  dynamic value;

  Variable({required this.value});
}

class InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.none;
  double height = 0.0;
  Variable weight = Variable(value: 0);
  Variable age = Variable(value: 0);

  Widget setButtons(Variable variable) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RoundButton(
          iconData: FontAwesomeIcons.minus,
          pressed: () {
            setState(() {
              variable.value =
                  variable.value - 1 >= 0 ? variable.value - 1 : variable.value;
            });
          },
        ),
        const SizedBox(
          width: 10.0,
        ),
        RoundButton(
          iconData: FontAwesomeIcons.plus,
          pressed: () {
            setState(() {
              variable.value = variable.value + 1 <= 200
                  ? variable.value + 1
                  : variable.value;
            });
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CreateCard(
                      color: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      onPress: () {
                        setState(() {
                          selectedGender = selectedGender == Gender.male
                              ? Gender.none
                              : Gender.male;
                        });
                      },
                      child: const CardContents(
                        iconData: FontAwesomeIcons.mars,
                        text: "MALE",
                      ),
                    ),
                  ),
                  Expanded(
                    child: CreateCard(
                      color: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      onPress: () {
                        setState(() {
                          selectedGender = selectedGender == Gender.female
                              ? Gender.none
                              : Gender.female;
                        });
                      },
                      child: const CardContents(
                        iconData: FontAwesomeIcons.venus,
                        text: "FEMALE",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CreateCard(
                color: kActiveCardColor,
                onPress: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "HEIGHT",
                      style: kTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toStringAsFixed(1),
                          style: kBoldText,
                        ),
                        const Text(
                          "cm",
                          style: kTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: const Color(0XFF8D8E98),
                        thumbColor: const Color(0XFFEB1555),
                        overlayColor: const Color(0X29EB1555),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                      ),
                      child: Slider(
                        value: height,
                        min: minHeight,
                        max: maxHeight,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CreateCard(
                      color: kActiveCardColor,
                      onPress: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "WEIGHT",
                            style: kTextStyle,
                          ),
                          Text(
                            weight.value.toString(),
                            style: kBoldText,
                          ),
                          setButtons(weight),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CreateCard(
                      color: kBottomContainerColor,
                      onPress: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "AGE",
                            style: kTextStyle,
                          ),
                          Text(
                            age.value.toString(),
                            style: kBoldText,
                          ),
                          setButtons(age),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Calculator calculator = Calculator(height: height, weight: weight.value);
                String bmi = calculator.calculateBMI();
                String result = calculator.getResults();
                String comments = calculator.getComments();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ResultsPage(comments: comments, report: bmi, result: result)),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  color: const Color(0xFFEB1555),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                width: double.infinity,
                height: kBottomContainerHeight,
                child: const Center(
                  child: Text(
                    "CALCULATE",
                    style: kLargeText,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class RoundButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback pressed;

  const RoundButton({Key? key, required this.iconData, required this.pressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: pressed,
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      padding: const EdgeInsets.all(0.0),
      child: Icon(iconData),
    );
  }
}
