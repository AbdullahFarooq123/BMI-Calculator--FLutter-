import 'package:flutter/material.dart';
import 'package:untitled1/input_page.dart';
import 'card.dart';
import 'constants.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key, required this.comments, required this.report, required this.result}) : super(key: key);
  final String result;
  final String report;
  final String comments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'YOUR RESULT',
                style: kXLargeText,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CreateCard(
              color: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    result,
                    style: kResultText,
                  ),
                  Text(
                    report,
                    style: kBMIText,
                  ),
                  Text(
                    comments,
                    textAlign: TextAlign.center,
                    style: kCommentText,
                  )
                ],
              ),
              onPress: () {},
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
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
                  "RE-CALCULATE",
                  style: kLargeText,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
