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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            ),
            highlightColor: Colors.deepPurple[50],
            padding: EdgeInsets.all(8),
            child: child,
            onPressed: enable == true ? onPressed : null,
          )
        ),
      ),
    );
  }

}