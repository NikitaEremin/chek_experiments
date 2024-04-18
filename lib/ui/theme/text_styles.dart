import 'dart:ui';

import 'package:chek_experiments/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const _fontName = 'Iskra';

  static const TextTheme textTheme = TextTheme(

    headlineLarge: display1, //название субъекта
    headlineMedium: display2, //унп и номер кассы
    bodyLarge: buttonLargeText, //текст больших кнопок
    bodyMedium: buttonMediumText, //текст маленьких кнопок
    labelMedium: labelMedium,
  );

  static const TextStyle display1 = TextStyle(
    fontFamily: _fontName,
    fontWeight: FontWeight.bold,
    fontSize: 32,
    letterSpacing: 0.4,
    height: 0.9,
    color: AppColors.blackGreen,
  );

  static const TextStyle display2 = TextStyle(
    fontFamily: _fontName,
    fontWeight: FontWeight.normal,
    fontSize: 26,
    color: AppColors.blackGreen,
  );

  static const TextStyle buttonLargeText = TextStyle(
    fontFamily: _fontName,
    fontWeight: FontWeight.normal,
    fontSize: 24,
    // letterSpacing: 0.4,
    // height: 0.9,
    color: AppColors.blackGreen,
  );

  static const TextStyle buttonMediumText = TextStyle(
    fontFamily: _fontName,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    letterSpacing: 0.4,
    height: 0.9,
    color: AppColors.blackGreen,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: _fontName,
    fontWeight: FontWeight.w800,
    fontSize: 14,
    // letterSpacing: 0.4,
    // height: 0.9,
    // color: AppColors.black,
  );

}


