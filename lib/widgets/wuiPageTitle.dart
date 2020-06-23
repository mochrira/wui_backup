import 'package:flutter/material.dart';

class WuiPageTitle extends StatelessWidget {

  String title;
  String subTitle;
  TextStyle titleTextStyle = TextStyle(
    fontSize: 28
  );

  WuiPageTitle({
    this.title,
    this.subTitle,
    this.titleTextStyle
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 28).merge(titleTextStyle)),
        SizedBox(height: 8),
        Text(subTitle, textAlign: TextAlign.center)
      ],
    );
  }
}