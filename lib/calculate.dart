import 'dart:math';

class Calculate {
  Calculate({
    required this.weight,
    required this.height,
  });

  final int height;
  final int weight;
  late double _bmi;

  String calculateBMI() {
    _bmi = (weight) / pow(height, 2);
    _bmi = _bmi * 10000;
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String getReview() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight.';
    } else {
      return 'You have a lower than normal body weight.';
    }
  }
}
