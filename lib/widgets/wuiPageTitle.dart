import 'package:flutter/material.dart';

class WuiPageTitle extends StatelessWidget {

  final String title;
  final String subTitle;
  final TextStyle titleTextStyle;

  WuiPageTitle({
    this.title,
    this.subTitle,
    this.titleTextStyle
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 28).merge(titleTextStyle)),
        SizedBox(height: 8),
        Container(
          constraints: BoxConstraints(
            maxWidth: 256
          ),
          child: Text(subTitle, textAlign: TextAlign.center)
        )
      ],
    );

  }
}