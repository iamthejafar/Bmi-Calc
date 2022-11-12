import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  final String buttonText;
  final Function navigateTo;

  BottomButton({required this.buttonText,required this.navigateTo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        navigateTo();
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        color: kBottomContainerColor,
        height: 65.0,
        child: Align(
          alignment: Alignment.center,
          child: Text(buttonText,style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),),
        ),
      ),
    );
  }
}