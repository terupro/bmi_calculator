import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.weight, required this.height});

  final int weight;
  final int height;
  late double _bmi;

  String getCalculatorBMI() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResultLabel() {
    _bmi = weight / pow(height/100, 2);
     if (_bmi >= 25) {
      return 'HIGHER BMI';
    } else if (_bmi >= 18.5) {
      return 'NORMAL BMI';
    } else {
      return 'LOWER BMI';
    }
  }

}