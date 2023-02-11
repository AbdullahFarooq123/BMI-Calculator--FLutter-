import 'dart:math';
class Calculator{
  Calculator({required this.height,required this.weight}):_bmi = 0;
  dynamic height;
  dynamic weight;
  double _bmi;
  String calculateBMI(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String getResults(){
    if(_bmi>=25){
      return "Overweight";
    }else if (_bmi>18.5){
      return "Normal";
    }else{
      return "Underweight";
    }
  }
  String getComments(){
    if(_bmi>=25){
      return "Try Exercising more to reduce your weight.";
    }else if (_bmi>18.5){
      return "Completely Normal. Good Job!";
    }else{
      return "Try eating more to gain weight.";
    }
  }
}