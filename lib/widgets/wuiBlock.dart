import 'package:flutter/material.dart';

class WuiBlock extends StatelessWidget {

  Widget child;
  BorderRadius radius;

  WuiBlock({
    this.child,
    this.radius
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: radius,
        boxShadow: [BoxShadow(
          blurRadius: 2,
          color: Colors.black.withOpacity(.1),
          spreadRadius: 0,
          offset: Offset(0, 2)
        )]
      ),
      child: child
    );
  }
}