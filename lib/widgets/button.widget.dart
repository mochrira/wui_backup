import 'package:flutter/material.dart';

enum WuiButtonSize { small, medium, large }
enum WuiButtonTheme { 
  normal, primary, transparent, 
  transparentPrimary
}

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
  final WuiButtonTheme theme;
  final IconData icon;
  final bool isDense;

  WuiButton({
    this.icon,
    this.child,
    this.size = WuiButtonSize.medium,
    this.rounded = false,
    this.theme = WuiButtonTheme.normal,
    this.onPressed,
    this.isDense = false
  });

  Color _getBackground(BuildContext context, index) {
    List<Color> colors = [Colors.grey[200], Theme.of(context).primaryColor, Colors.transparent, Colors.transparent];
    return colors[index];
  }

  Color _getTextColor(BuildContext context, index) {
    List<Color> colors = [Colors.black.withOpacity(.67), Colors.white, Colors.black.withOpacity(.67), Theme.of(context).primaryColor];
    return colors[index];
  }

  WuiButtonStyle _getStyle(BuildContext context, index) {
    List<WuiButtonStyle> style = [
      WuiButtonStyle(
        height: isDense ? 32 : 36,
        textStyle: Theme.of(context).textTheme.bodyText1.copyWith(
          color: _getTextColor(context, theme.index),
          fontSize: 14
        ),
        padding: EdgeInsets.symmetric(horizontal: isDense ? 10 : 16),
        roundedPadding: EdgeInsets.fromLTRB(24, 0, 24, 0),
        roundedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))
      ),
      WuiButtonStyle(
        height: isDense ? 36 : 44,
        textStyle: Theme.of(context).textTheme.bodyText1.copyWith(
          color: _getTextColor(context, theme.index),
          fontSize: 16
        ),
        padding: EdgeInsets.symmetric(horizontal: 16),
        roundedPadding: EdgeInsets.fromLTRB(32, 0, 32, 0),
        roundedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22))
      ),
      WuiButtonStyle(
        height: isDense ? 44 : 52,
        textStyle: Theme.of(context).textTheme.bodyText1.copyWith(
          color: _getTextColor(context, theme.index),
          fontSize: 18
        ),
        padding: EdgeInsets.symmetric(horizontal: 24),
        roundedPadding: EdgeInsets.fromLTRB(40, 0, 40, 0),
        roundedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26))
      )
    ];
    return style[index];
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: onPressed == null ? .2 : 1,
      child: RawMaterialButton(
        elevation: 0,
        highlightElevation: 0,
        focusElevation: 0,
        constraints: BoxConstraints(
          minHeight: _getStyle(context, this.size.index).height,
          maxHeight: _getStyle(context, this.size.index).height
        ),
        textStyle:_getStyle(context, this.size.index).textStyle,
        padding: rounded ? _getStyle(context, this.size.index).roundedPadding : _getStyle(context, this.size.index).padding,
        fillColor: _getBackground(context, theme.index),
        shape: rounded ? _getStyle(context, this.size.index).roundedShape : RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: icon != null ? Row(
          mainAxisSize: MainAxisSize.min,
          children: [ Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(icon),
          ), child ],
        ) : child,
        onPressed: onPressed
      ),
    );
  }
}