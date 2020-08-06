import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ...(title != null ? [
          Text(title, 
            textAlign: TextAlign.center, 
            style: Theme.of(context).textTheme.headline4.merge(GoogleFonts.nunito())
          )
        ] : []),
        SizedBox(height: 8),
        ...(subTitle != null ? [Container(
          constraints: BoxConstraints(
            maxWidth: 256
          ),
          child: (subTitle is String) ? Text(subTitle, style: TextStyle(fontSize: 16), textAlign: TextAlign.center) : subTitle
        )] : [])
      ],
    );

  }
}