import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyConstant {
  //field

  static Color primary = const Color.fromARGB(255, 240, 225, 110);
  static Color dark = const Color.fromARGB(255, 0, 74, 117);
  static Color active = const Color.fromARGB(255, 245, 84, 72);

  //method

  BoxDecoration bgBox() {
    return BoxDecoration(
      gradient: RadialGradient(
        radius: 1.0,
        center: const Alignment(-0.3, -0.3),
        colors: [Colors.white, primary],
      ),
    );
  }

  TextStyle h1Style() {
    return GoogleFonts.mitr(
        textStyle: TextStyle(
      fontSize: 36,
      color: dark,
      fontWeight: FontWeight.w700,
    ));
  }

  TextStyle h2Style() {
    return GoogleFonts.mitr(
        textStyle: TextStyle(
      fontSize: 18,
      color: dark,
      fontWeight: FontWeight.w700,
    ));
  }

  TextStyle h3Style() {
    return GoogleFonts.mitr(
        textStyle: TextStyle(
      fontSize: 14,
      color: dark,
      fontWeight: FontWeight.w500,
    ));
  }

  TextStyle h3ActiveStyle() {
    return GoogleFonts.mitr(
        textStyle: TextStyle(
      fontSize: 14,
      color: active,
      fontWeight: FontWeight.bold,
    ));
  }
}
