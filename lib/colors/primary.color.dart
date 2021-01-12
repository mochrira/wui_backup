import 'package:flutter/material.dart';

Color textColor = Colors.black.withOpacity(.67);

WuiThemeData(context, { primarySwatch: ThemeData }) {
  return ThemeData(
    primarySwatch: primarySwatch ?? Colors.deepPurple,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: textColor
      ),
      actionsIconTheme: IconThemeData(
        color:textColor
      ),
      color: Colors.white,
      elevation: 0,
      textTheme: TextTheme(
        headline6: Theme.of(context).textTheme.headline6.copyWith(
          color: textColor
        )
      )
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 0
    ),
    iconTheme: Theme.of(context).iconTheme.copyWith(
      color: textColor
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black.withOpacity(.08)
        )
      )
    ),
    textTheme: TextTheme(
      subtitle1: Theme.of(context).textTheme.subtitle1.copyWith(
        color: textColor
      ),
      headline4: Theme.of(context).textTheme.headline4.copyWith(
        color: textColor
      ),
      headline6: Theme.of(context).textTheme.headline6.copyWith(
        color: textColor
      ),
      bodyText1: Theme.of(context).textTheme.bodyText1.copyWith(
        color: textColor
      ),
      bodyText2: Theme.of(context).textTheme.bodyText2.copyWith(
        color: textColor
      ),
    )
  );
}