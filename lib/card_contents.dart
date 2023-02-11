import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/constants.dart';

class CardContents extends StatelessWidget {
  final IconData iconData;
  final String text;

  const CardContents({Key? key, required this.iconData, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 70.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: kTextStyle,
        )
      ],
    );
  }
}