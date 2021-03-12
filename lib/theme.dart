import 'package:flutter/material.dart';
import 'package:wui/constants.dart';

class WuiTheme {

  static WuiTheme _instance = WuiTheme._internal();
  WuiTheme._internal();
  factory WuiTheme() {
    return _instance;
  }

  Color? _wTextColor;
  get textColor => _wTextColor;

  Color? _wHeadingColor;
  get headingColor => _wHeadingColor;

  Color? _wPrimaryColor;
  get primaryColor => _wPrimaryColor;

  Color? _wSecondaryColor;
  get secondaryColor => _wSecondaryColor;

  light(BuildContext context, {
    Color? textColor,
    Color? headingColor,
    Color? primaryColor,
    Color? secondaryColor
  }) {
    _wTextColor = textColor ?? wTextColor;
    _wHeadingColor = headingColor ?? wHeadingColor;
    _wPrimaryColor = primaryColor ?? wPrimaryColor;
    _wSecondaryColor = secondaryColor ?? wSecondaryColor;
    return _themeData(context);
  }

  dark(BuildContext context, {
    Color? textColor,
    Color? headingColor,
    Color? primaryColor,
    Color? secondaryColor
  }) {
    _wTextColor = textColor ?? wTextColor;
    _wHeadingColor = headingColor ?? wHeadingColor;
    _wPrimaryColor = primaryColor ?? wPrimaryColor;
    _wSecondaryColor = secondaryColor ?? wSecondaryColor;
    return _themeData(context);
  }

  _themeData(BuildContext context) {
    return ThemeData(
      primaryColor: _wPrimaryColor,
      textTheme: Theme.of(context).textTheme.copyWith(
        bodyText1: Theme.of(context).textTheme.bodyText1!.copyWith(
          color: _wHeadingColor
        ),
        bodyText2: Theme.of(context).textTheme.bodyText2!.copyWith(
          color: _wTextColor
        )
      )
    );
  }

}