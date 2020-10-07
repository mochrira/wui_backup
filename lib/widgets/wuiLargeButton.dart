import 'package:flutter/material.dart';

class WuiLargeButton extends StatelessWidget {

  final Widget child;
  final Function onPressed;
  final BorderRadius borderRadius;
  WuiLargeButton({
    this.child,
    this.onPressed,
    this.borderRadius
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(8)
      ),
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyText2.copyWith(
          color: onPressed != null ? Colors.white : Colors.grey[100],
          fontWeight: FontWeight.w500,
          fontSize: 16
        ),
        child: child
      ),
      fillColor: onPressed != null ? Colors.deepPurple : Colors.deepPurple[200],
      onPressed: onPressed,
    );
  }
}