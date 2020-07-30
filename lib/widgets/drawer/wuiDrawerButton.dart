import 'package:flutter/material.dart';

class WuiDrawerButton extends StatelessWidget {

  final String caption;
  final Icon icon;
  final Function onPressed;
  final bool active;

  WuiDrawerButton({
    this.caption,
    this.icon,
    this.onPressed,
    this.active
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      height: 48,
      child: RawMaterialButton(
        fillColor: ((active ?? false) == true ? 
          Colors.deepPurple.withOpacity(.2) : 
          Colors.transparent),
        elevation: 0,
        highlightElevation: 0,
        disabledElevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: IconTheme(
                data: IconThemeData(
                  color: (active ?? false) ? Colors.deepPurple : Colors.black.withOpacity(.8),
                  size: 24
                ),
                child: icon
              )
            ),
            Text(caption, 
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                color: (active ?? false) ? Colors.deepPurple : Colors.black.withOpacity(.8),
                fontWeight: FontWeight.w500,
                fontSize: 14
              )
            )
          ],
        ),
        onPressed: onPressed,
      )
    );
  }
}