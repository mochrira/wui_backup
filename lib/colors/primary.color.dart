import 'package:flutter/material.dart';

ThemeData wuiThemeData = ThemeData(
  primarySwatch: Colors.deepPurple,
  appBarTheme: AppBarTheme(
    color: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.black87
    ),
    textTheme: TextTheme(
      headline6: TextStyle(
        fontFamily: "Product Sans",
        fontSize: 22
      )
    )
  ),
  textTheme: TextTheme(
    headline4: TextStyle(
      fontSize: 32,
      color: Colors.black87
    ),
    bodyText2: TextStyle(
      fontSize: 16,
      color: Colors.black87
    )
  )
);