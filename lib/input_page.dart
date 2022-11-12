import 'package:bmi_new/result_page.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'constants.dart';
import 'package:flutter/material.dart';
import 'custom_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'calculator_brain.dart';
import 'bottom_button.dart';
import 'my_button.dart';


class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
   Gender selectedGender = Gender.other;
   int height = 135;
   int weight = 50;
   int age = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR',style: kAppBarText,),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: GestureDetector(
                onTap: (){
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                child: CustomContainer(
                  colorName: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                  cardChild: const IconContent(
                    cardIcon: FontAwesomeIcons.mars,
                    genderText: 'MALE',
                    ),
                  ),
                ),
              ),
              Expanded(child: GestureDetector(
                onTap: (){
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                child: CustomContainer(
                  colorName: selectedGender==Gender.female?kActiveCardColor:kInactiveCardColor,
                  cardChild: const IconContent(
                    cardIcon: FontAwesomeIcons.venus,
                    genderText: 'FEMALE',
                    ),
                  ),
                ),
              ),
            ],
          ),),
          Expanded(child: CustomContainer(
            colorName: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('HEIGHT'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(),style: kNumberTextStyle,),
                    const Text('cm',style: kLabelTextStyle,)
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.teal,
                    inactiveTrackColor: Colors.green,
                    thumbColor: Colors.pinkAccent,
                    overlayColor: Colors.pinkAccent,
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0)
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 320,
                    activeColor: Colors.redAccent,
                    inactiveColor: kBottomContainerColor,
                    onChanged: (double newValue){
                    setState(() { height = newValue.round();});
                    }
                  ),
                )
              ],
            )
          ),),
          Expanded(child: Row(
            children: [
              Expanded(child: CustomContainer(
                colorName: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('WEIGHT',style: kLabelTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(weight.toString(),style: kNumberTextStyle,),
                        const SizedBox(width: 5.0,),
                        const Text('Kg',style: kLabelTextStyle,)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyButton(
                          icon: FontAwesomeIcons.plus,
                          press: (){
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                        const SizedBox(width: 10.0,),
                        MyButton(
                          icon: FontAwesomeIcons.minus,
                          press: (){
                            setState(() {
                              weight--;
                            });
                          },
                        )
                      ],
                    )
                  ],
                )
              )),
              Expanded(child: CustomContainer(
                colorName: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SleekCircularSlider(
                      min: 5,
                      max: 150,
                      appearance: CircularSliderAppearance(
                        customColors: CustomSliderColors(
                          trackColor: Colors.red,
                          progressBarColor: Colors.teal,
                        ),
                        size: 130,
                        infoProperties: InfoProperties(
                          mainLabelStyle: kNumberTextStyle,
                          topLabelStyle: kLabelTextStyle,
                          modifier: (double value){
                            final roundedValue = value.ceil().toInt();
                            return roundedValue.toString();
                            },
                          topLabelText: 'AGE',
                        )
                      ),
                      onChange: (double val){
                        setState(() {
                          age = val.round();
                        });
                      },
                    ),
                  ],
                )
              )),
            ],
          )),
          BottomButton(
              buttonText: 'CALCULATE BMI',
              navigateTo: (){
                CalculatorBrain calc = CalculatorBrain(height, weight);
                Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return ResultPage(
                        bmiResult: calc.calculateBMI(),
                        bmiText: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                      );
                    }
                )
                );
              }
          )
        ],
      ),
    );
  }
}



