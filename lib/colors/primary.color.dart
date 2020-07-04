import 'package:flutter/material.dart';

ThemeData wuiThemeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
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
  tabBarTheme: TabBarTheme(
    labelColor: Colors.black87,
  ),
  bottomAppBarColor: Colors.white,
  bottomAppBarTheme: BottomAppBarTheme(
    color: Colors.white
  ),
  textTheme: TextTheme(
    headline4: TextStyle(
      fontSize: 32,
      color: Colors.black87
    ),
    bodyText2: TextStyle(
      fontSize: 16,
      color: Colors.black87
    ),
    subtitle1: TextStyle(
      fontSize: 16
    )
  )
);