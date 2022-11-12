import 'package:flutter/material.dart';
import 'constants.dart';
import 'custom_container.dart';
import 'bottom_button.dart';


class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.bmiResult, required this.bmiText, required this.interpretation});
  final String bmiResult;
  final String bmiText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR',style: kAppBarText,),
        ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:  [
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Container(
              margin: const EdgeInsets.fromLTRB(10,5 ,10, 0),
              child: const Text('Your Result',style: kResultText,),
            ),
          ),
          Expanded(
            child: CustomContainer(
              colorName: kActiveCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [
                  Text(bmiText.toUpperCase(),style: kLabelTextStyle),
                  Text(bmiResult,style: kNumberTextStyle),
                  Text(interpretation,textAlign: TextAlign.center,style: kLabelTextStyle),
                ],
              ),
            )
          ),
          BottomButton(
                buttonText: 'RE-CALCULATE BMI',
                navigateTo: (){
                  Navigator.pop(context);
                }
          )
        ],
      )
    );
  }
}


