import 'package:flutter/material.dart';

enum ColorTheme {
  primaryColor(
    Color(0xFFBB0055),
    Color(0xFFBB0055),
  ),
  primaryColorVariant(
    Color.fromARGB(255, 133, 1, 61),
    Color.fromARGB(255, 133, 1, 61),
  ),
  // onPrimaryColor(
  //   Colors.white,
  //   Colors.white,
  // ),
  secondaryColor(
    Color(0xFFF37374),
    Color(0xFFF37374),
  ),
  secondaryColorVariant(
    Color(0xFFF6E2EA),
    Color(0xFFF6E2EA),
  ),
  tertiaryColor(
    Color(0xFFFDBB17),
    Color(0xFFFDBB17),
  ),
  navigationBar(
    Color(0xFFE03D79),
    Color(0xFFE03D79),
  ),
  textColor(
    Colors.white,
    Colors.black,
  ),
  textColorVariant(
    Colors.black54,
    Color(0xFFA5A5A5),
  ),
  background(
    Colors.white,
    Color(0xFF302C35),
  ),
  // primaryVariant(
  //   Color(0xFFF6E2EA),
  //   Color(0xFF570B2B),
  // ),
  // secondaryColor(
  //   Color(0xFFFFC50A),
  //   Color(0xFFFFC50A),
  // ),
  // secondaryVariant(
  //   Color(0xFFFFF3CE),
  //   Color(0xFF715A0F),
  // ),
  // systemBar(
  //   Color(0xFF8F003C),
  //   Color(0xFF5E0027),
  // ),
  ;

  const ColorTheme(this.light, this.dark);
  final Color light;
  final Color dark;
}
