import 'package:bmi_new/constants.dart';
import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback press;

  const MyButton({super.key, required this.icon, required this.press});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: press,
      shape: const CircleBorder(),
      elevation: 6.0,
      fillColor: kBottomContainerColor,
      constraints: const BoxConstraints.tightFor(
          height: 56.0,
          width: 56.0
      ),
      child: Icon(icon),
    );
  }
}