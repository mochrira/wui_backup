import 'package:flutter/material.dart';

class WuiPageTitle extends StatelessWidget {

  final String title;
  final dynamic subTitle;
  final TextStyle titleTextStyle;

  WuiPageTitle({
    this.title,
    this.subTitle,
    this.titleTextStyle
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ...(title != null ? [
            Text(title, 
              textAlign: TextAlign.center, 
              style: Theme.of(context).textTheme.headline1
            )
          ] : []),
          SizedBox(height: 8),
          ...(subTitle != null ? [Container(
            child: (subTitle is String) ? Text(subTitle, textAlign: TextAlign.center) : subTitle
          )] : [])
        ],
      ),
    );

  }
}