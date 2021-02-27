import 'package:flutter/material.dart';

Color convertToColor(String color) {
  String stringColor = color.replaceAll("#", '');
  Color finalColor;
  if (stringColor.length == 6) {
    finalColor = Color(int.parse("0xFF" + stringColor));
  } else if (stringColor.length == 8) {
    finalColor = Color(int.parse("0x" + stringColor));
  }
  return finalColor;
}
