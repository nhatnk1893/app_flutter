import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ConstantsApp {
  static String appName = "Store";
  static String fontFamilyDencingFont = 'DancingFont';
  static Color lightPrimary = Colors.white;
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Color(0xff06d6a7);
  static Color darkAccent = Color(0xff06d6a7);
  static Color lightBG = Colors.white;
  static Color darkBG = Colors.black;
  static Icon iconTurnOff = Icon(Feather.moon);
  static Icon iconTurnOn = Icon(Feather.sun);
  static String labelTurnOff = "Mode Dark";
  static String labelTurnOn = "Mode Light";

  static Color lightBG1 = Colors.deepPurple;
  static Color darkBG1 = Colors.deepOrange;

  static ThemeData lightTheme = ThemeData(
    fontFamily: "TimesNewRoman",
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        title: TextStyle(
          fontFamily: "TimesNewRoman",
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: "TimesNewRoman",
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        title: TextStyle(
          fontFamily: "TimesNewRoman",
          color: lightBG,
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );
}
