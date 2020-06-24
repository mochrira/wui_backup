import 'package:flutter/material.dart';

class WuiLargeButton extends StatelessWidget {

  final Widget child;
  final Function onPressed;
  WuiLargeButton({
    this.child,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
          buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary
          ),
        ),
        child: RaisedButton(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32)
          ),
          color: Colors.deepPurple,
          child: child,
          onPressed: onPressed,
        )
      );
  }
}