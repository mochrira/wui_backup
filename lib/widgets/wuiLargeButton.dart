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
    return RawMaterialButton(
      padding: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
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