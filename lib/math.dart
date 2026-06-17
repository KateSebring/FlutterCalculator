import 'package:flutter/material.dart';
import 'dart:math';

class MathCalculations  {
  double add(double val1, double val2) {
    return val1 + val2;
  }

  double subtract(double val1, double val2) {
    return val1 - val2;
  }

  double multiply(double val1, double val2) {
    return val1 * val2;
  }

  double divide(double val1, double val2) {
    return val1 / val2;
  }

  double power(double val1, double val2) {
    return pow(val1, val2).toDouble();
  }

  double reciprocal(double val) {
    return 1 / val;
  }

  double squareRoot(double val) {
    return sqrt(val);
  }

  double factorial(int val) {
    double result = 1;
    for (int i = 1; i <= val; i++) {
      result *= i;
    }

    return result;
  }
}