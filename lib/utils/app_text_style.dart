

import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle title({
    double? fontSize,
    Color? color,
   FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 28,
      fontWeight: fontWeight ?? FontWeight.bold,
      color: color , 
    );
  }
  static TextStyle subTitle({
    double? fontSize,
    Color? color,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 16,
      fontWeight: FontWeight.bold,
      color: color 
    );
  }
  static TextStyle medium({
    double? fontSize,
    Color? color,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 14,
      fontWeight: FontWeight.bold,
      color: color 
    );
  }

  static TextStyle caption({
    double? fontSize,
    Color? color,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 12,
      fontWeight: FontWeight.bold,
      color: color 
    );
  }
}