import 'package:flutter/material.dart';

abstract class AppColors {
  // Global reference to application colors
  static const whiteTitanium = Color(0xFFFFFFFF);
  static const greyLight = Color(0xFFBEBEBE);
  static const greyDark = Color(0xFF333333);
  static const blackCoal = Color(0xFF101010);
  static const yellowSun = Color(0xFFFFD700);
  static const orangeJuice = Color(0xFFFDAF01);
  static const redLava = Color(0xFFFD4601);
  static const greenMint = Color(0xFF66AC52);

  // ThemeData Light Mode
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    backgroundColor: whiteTitanium,
    primaryColor: blackCoal,
    cardColor: greyDark,
    indicatorColor: greyLight,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
  );

  // ThemeData Dark Mode
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: blackCoal,
    primaryColor: whiteTitanium,
    cardColor: greyLight,
    indicatorColor: greyDark,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
  );
}
