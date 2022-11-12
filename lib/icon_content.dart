import 'package:bmi_new/constants.dart';
import 'package:flutter/material.dart';
class IconContent extends StatelessWidget {
  final IconData cardIcon;
  final String genderText;
  const IconContent({super.key, required this.cardIcon,required this.genderText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          color: Colors.black,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(genderText,
          style: kLabelTextStyle,
        )

      ],
    );
  }
}