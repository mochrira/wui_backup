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
    return RaisedButton(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32)
      ),
      color: Colors.deepPurple,
      child: Theme(
        data: ThemeData(
          textTheme: TextTheme(
            bodyText2: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white)
          )
        ),
        child: child
      ),
      onPressed: onPressed,
    );
  }
}