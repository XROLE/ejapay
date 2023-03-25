import 'package:ejapay/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppTextStyle', () {
    test('title should return a TextStyle object with the correct properties', () {
      // arrange
      final style = AppTextStyle.title(
        fontSize: 24,
        color: Colors.red,
        fontWeight: FontWeight.normal,
      );

      // assert
      expect(style.fontSize, 24);
      expect(style.color, Colors.red);
      expect(style.fontWeight, FontWeight.normal);
    });

    test('subTitle should return a TextStyle object with the correct properties', () {
      // arrange
      final style = AppTextStyle.subTitle(
        color: Colors.blue,
      );

      // assert
      expect(style.fontSize, 16);
      expect(style.color, Colors.blue);
      expect(style.fontWeight, FontWeight.bold);
    });

    test('medium should return a TextStyle object with the correct properties', () {
      // arrange
      final style = AppTextStyle.medium(
        fontSize: 18,
      );

      // assert
      expect(style.fontSize, 18);
      expect(style.color, null);
    });

    test('caption should return a TextStyle object with the correct properties', () {
      // arrange
      final style = AppTextStyle.caption(
        color: Colors.green,
      );

      // assert
      expect(style.fontSize, 12);
      expect(style.color, Colors.green);
      expect(style.fontWeight, FontWeight.bold);
    });
  });
}