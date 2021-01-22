import 'package:flutter/material.dart';

enum WuiButtonSize { small, medium, large }

class WuiButtonStyle {

  final double height;
  final TextStyle textStyle;
  final EdgeInsets padding;
  final EdgeInsets roundedPadding;
  final ShapeBorder roundedShape;

  WuiButtonStyle({
    this.height,
    this.textStyle,
    this.padding,
    this.roundedPadding,
    this.roundedShape
  });

}


class WuiButton extends StatelessWidget {

  final Widget child;
  final WuiButtonSize size;
  final bool rounded;
  final Function onPressed; 

  WuiButton({
    this.child,
    this.size = WuiButtonSize.medium,
    this.rounded = false,
    this.onPressed
  });

  WuiButtonStyle _getStyle(BuildContext context, index) {
    List<WuiButtonStyle> style = [
      WuiButtonStyle(
        height: 36,
        textStyle: Theme.of(context).textTheme.bodyText1.copyWith(
          color: Colors.white,
          fontSize: 14
        ),
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        roundedPadding: EdgeInsets.fromLTRB(24, 0, 24, 0),
        roundedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))
      ),
      WuiButtonStyle(
        height: 44,
        textStyle: Theme.of(context).textTheme.bodyText1.copyWith(
          color: Colors.white,
          fontSize: 16
        ),
        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
        roundedPadding: EdgeInsets.fromLTRB(32, 0, 32, 0),
        roundedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22))
      ),
      WuiButtonStyle(
        height: 52,
        textStyle: Theme.of(context).textTheme.bodyText1.copyWith(
          color: Colors.white,
          fontSize: 18
        ),
        padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
        roundedPadding: EdgeInsets.fromLTRB(40, 0, 40, 0),
        roundedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26))
      )
    ];
    return style[index];
  }

  @override
  Widget build(BuildContext context) {
    print(this.size.index);
    return RawMaterialButton(
      elevation: 0,
      highlightElevation: 0,
      focusElevation: 0,
      constraints: BoxConstraints(
        minHeight: _getStyle(context, this.size.index).height
      ),
      textStyle:_getStyle(context, this.size.index).textStyle,
      padding: rounded ? _getStyle(context, this.size.index).roundedPadding : _getStyle(context, this.size.index).padding,
      fillColor: onPressed == null ? Theme.of(context).primaryColor.withOpacity(.6) : Theme.of(context).primaryColor,
      shape: rounded ? _getStyle(context, this.size.index).roundedShape : RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: child ?? null,
      onPressed: onPressed
    );
  }
}