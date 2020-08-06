import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData wuiThemeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    textTheme: TextTheme(
      headline6: GoogleFonts.nunito(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black87
      )
    ),
    elevation: 0,
    color: Colors.white,
    actionsIconTheme: IconThemeData(
      color: Colors.black87
    ),
    iconTheme: IconThemeData(
      color: Colors.black87
    )
  ),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary
  ),
  primarySwatch: Colors.deepPurple,
  textTheme: TextTheme(
    subtitle1: GoogleFonts.nunito().copyWith(
      color: Colors.black87,
      fontWeight: FontWeight.w600
    ),
    subtitle2: GoogleFonts.nunito().copyWith(
      color: Colors.black54
    ),
    headline4: TextStyle(
      color: Colors.black87
    ),
    bodyText2: GoogleFonts.nunito().copyWith(
      color: Colors.black87
    ),
    button: GoogleFonts.nunito()
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: GoogleFonts.nunito(fontWeight: FontWeight.w600),
    
  )
);