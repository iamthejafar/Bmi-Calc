
import 'dart:math';

class CalculatorBrain{
  final int height;
  final int weight;

  CalculatorBrain(this.height,this.weight);
  double bmi=0;
  String calculateBMI(){
    bmi = weight/(pow(height/100, 2));
    return bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(bmi>=25) {
      return 'OVERWEIGHT';
    } else if(bmi>18.5){
      return 'NORMAL';
    }
    else{
      return 'UNDERWEIGHT';
    }
  }
  String getInterpretation(){
    if(bmi>=25) {
      return 'You Have Higher Weight';
    } else if(bmi>18.5){
      return 'You have Normal Weight';
    }
    else{
      return 'You have Normal Weight';
    }
  }

}