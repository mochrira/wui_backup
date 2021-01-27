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
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      margin: EdgeInsets.only(right: 24),
      child: RawMaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24),
            bottomRight: Radius.circular(24)
          )
        ),
        fillColor: ((active ?? false) == true ? 
          Colors.deepPurple.withOpacity(.2) : 
          Colors.transparent),
        elevation: 0,
        highlightElevation: 0,
        disabledElevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: IconTheme(
                data: IconThemeData(
                  color: (active ?? false) ? Colors.deepPurple : Colors.black.withOpacity(.7),
                  size: 24
                ),
                child: icon
              )
            ),
            Text(caption, 
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                color: (active ?? false) ? Colors.deepPurple : Colors.black.withOpacity(.7),
                fontWeight: FontWeight.w600,
                fontSize: 14,
              )
            )
          ],
        ),
        onPressed: onPressed,
      )
    );
  }
}