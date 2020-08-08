import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData wuiThemeData = ThemeData(
  scaffoldBackgroundColor: Color(0xFFECEFF1),
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
      color: Colors.black.withOpacity(.80)
    ),
    subtitle2: GoogleFonts.nunito().copyWith(
      color: Colors.black.withOpacity(.64)
    ),
    headline4: TextStyle(
      color: Colors.black.withOpacity(.70)
    ),
    bodyText2: GoogleFonts.nunito().copyWith(
      color: Colors.black.withOpacity(.70)
    ),
    button: GoogleFonts.nunito()
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: GoogleFonts.nunito(
      fontSize: 14
    )
  )
);