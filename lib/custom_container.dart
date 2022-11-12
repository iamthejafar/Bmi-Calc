import 'package:flutter/material.dart';
class CustomContainer extends StatelessWidget {
  final Widget cardChild;
  final Color colorName;
  const CustomContainer({super.key, required this.colorName, required this.cardChild});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: colorName,
            borderRadius: BorderRadius.circular(10.0)
        ),
        child: cardChild,
      ),
    );
  }
}