import 'package:flutter/material.dart';

Color textColor = Color.fromARGB(255, 38, 50, 56);
Color primaryColor = Colors.deepPurple;

ThemeData wuiThemeData = ThemeData(
  primarySwatch: Colors.deepPurple,
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    headline1: TextStyle(
      color: textColor,
      fontWeight: FontWeight.normal,
      fontFamily: "packages/wui/ProductSans",
      fontSize: 32
    ),
    bodyText2: TextStyle(
      fontSize: 16
    )
  ),
  appBarTheme: AppBarTheme(
    color: Colors.white,
    textTheme: TextTheme(
      headline6: TextStyle(
        fontSize: 20,
        color: textColor,
        fontFamily: "packages/wui/ProductSans"
      )
    ),
    iconTheme: IconThemeData(
      color: textColor
    )
  ),
  primaryIconTheme: IconThemeData(
    color: primaryColor
  ),
  iconTheme: IconThemeData(
    color: textColor
  ),
);