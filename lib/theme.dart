import 'package:flutter/material.dart';
import 'package:wui/constants.dart';

class WuiTheme {

  static light(BuildContext context) {
    return ThemeData(
      primarySwatch: wPrimarySwatch,
      scaffoldBackgroundColor: wScaffoldBackgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: wAppBarColor,
        textTheme: Theme.of(context).textTheme.copyWith(
          headline4: Theme.of(context).textTheme.headline4!.copyWith(
            color: wBodyText1Color
          ),
        ),
        elevation: 0,
        iconTheme: IconThemeData(
          color: wBodyText1Color
        ),
        actionsIconTheme: IconThemeData(
          color: wBodyText1Color
        )
      ),
      textTheme: Theme.of(context).textTheme.copyWith(
        headline1: Theme.of(context).textTheme.headline1!.copyWith(
          fontSize: 72,
          fontWeight: FontWeight.normal,
          color: wBodyText1Color
        ),
        headline2: Theme.of(context).textTheme.headline2!.copyWith(
          color: wBodyText1Color
        ),
        headline3: Theme.of(context).textTheme.headline3!.copyWith(
          color: wBodyText1Color
        ),
        headline4: Theme.of(context).textTheme.headline4!.copyWith(
          color: wBodyText1Color
        ),
        headline5: Theme.of(context).textTheme.headline5!.copyWith(
          color: wBodyText1Color,
          fontSize: 24
        ),
        bodyText1: Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: 16,
          color: wBodyText1Color
        ),
        bodyText2: Theme.of(context).textTheme.bodyText2!.copyWith(
          color: wBodyText2Color,
          fontSize: 14
        )
      )
    );
  }

}