import 'package:flutter/material.dart';

class MyConstant {
  //field

  static Color primary = const Color.fromARGB(255, 239, 235, 101);
  static Color dark = const Color.fromARGB(255, 0, 74, 117);

  //method

  TextStyle h1Style() {
    return TextStyle(
      fontSize: 36,
      color: dark,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle h2Style() {
    return TextStyle(
      fontSize: 18,
      color: dark,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle h3Style() {
    return TextStyle(
      fontSize: 14,
      color: dark,
      fontWeight: FontWeight.normal,
    );
  }
}
