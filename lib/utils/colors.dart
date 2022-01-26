import 'dart:math';

import 'package:flutter/material.dart';

class ColorsUtil {
  ColorsUtil._();

  static const Color primary_color= Color(0xff191919);
  static const Color primary_color_white = Colors.white;
  static const Color primary_color_white_bg = Color(0xffefefef);
  static const Color primary_color_black = Colors.black;
  static const Color primary_color_brown = Color(0xff707070);
  static const Color color_transparent = Color(0x0);
  static const Color color_list = Color(0xffFD8B2B);
  static const Color color_add = Color(0xff19AE63);
  static const Color color_clear = Color(0xfff60000);
}

MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1);

int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1);
