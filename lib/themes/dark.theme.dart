import 'package:flutter/material.dart';

const brightness = Brightness.dark;
const primaryColor = const Color(0xFFFF0000);
const lightColor = const Color(0xFFFFFFFF);
const backgroundColor = const Color(0xFF363636);

ThemeData darkTheme() {
  return ThemeData(
    brightness: brightness,
    textTheme: new TextTheme(
      bodyText1: new TextStyle(color: Colors.red),
      headline1: new TextStyle(fontSize: 30),
      button: new TextStyle(color: Colors.green),
    ),
    primaryColor: primaryColor,
    accentColor: Colors.white,
    backgroundColor: backgroundColor,
  );
}
