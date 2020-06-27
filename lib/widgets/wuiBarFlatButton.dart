import 'package:flutter/material.dart';

class WuiBarFlatButton extends StatelessWidget {

  final Widget child;
  final Function onPressed;
  final bool enable;
  WuiBarFlatButton({
    this.enable = true,
    this.child,
    this.onPressed
  });

  @override
  build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary
        )
      ),
      child: Container(
        padding: EdgeInsets.only(right: 4),
        child: Center(
          child: FlatButton(
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            ),
            highlightColor: Colors.deepPurple[50],
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: child,
            onPressed: enable == true ? onPressed : null,
          )
        ),
      ),
    );
  }

}