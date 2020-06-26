import 'package:flutter/material.dart';

class WuiSnackBar {

  static open(BuildContext context, {
    dynamic content,
    bool rootNavigator = true
  }) {
    Scaffold.of(context).hideCurrentSnackBar();
    Scaffold.of(context).showSnackBar(SnackBar(
      content: content is Widget ? content: Text(content),
      behavior: SnackBarBehavior.floating
    ));
  }
  

}