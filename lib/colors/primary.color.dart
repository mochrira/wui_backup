import 'package:flutter/material.dart';

ThemeData wuiThemeData = ThemeData(
  primarySwatch: Colors.deepPurple,
  dialogBackgroundColor: Colors.white,
  dialogTheme: DialogTheme(
    elevation: 0
  ),
  appBarTheme: AppBarTheme(
    color: Colors.white,
    actionsIconTheme: IconThemeData(
      color: Colors.black
    ),
    iconTheme: IconThemeData(
      color: Colors.black
    )
  ),
  textTheme: TextTheme(
    subtitle1: TextStyle(
      color: Colors.grey[700]
    ),
    bodyText2: TextStyle(
      color: Colors.grey[800]
    ),
    button: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 16
    )
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide.none
    ),
    fillColor: Colors.grey[200],
    hoverColor: Colors.white,
    filled: true,
  )
);