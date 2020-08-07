import 'package:flutter/material.dart';

enum WuiBadgeTheme{
  primary,
  success,
  normal,
  danger,
  warning
}

class WuiBadge extends StatelessWidget {

  Widget child;
  WuiBadgeTheme theme;

  WuiBadge({
    this.child,
    this.theme
  });

  _getColors(WuiBadgeTheme theme) {
    if(theme == WuiBadgeTheme.primary) {
      return Colors.deepPurple;
    } else if(theme == WuiBadgeTheme.danger) {
      return Colors.red;
    } else if(theme == WuiBadgeTheme.normal) {
      return Colors.blueGrey[100];
    } else if(theme == WuiBadgeTheme.success) {
      return Colors.green;
    } else if(theme == WuiBadgeTheme.warning) {
      return Colors.yellow;
    }
  }

  _getTextColors(WuiBadgeTheme theme) {
    if(theme == WuiBadgeTheme.primary || theme == WuiBadgeTheme.danger || theme == WuiBadgeTheme.success) {
      return Colors.white;
    } else if(theme == WuiBadgeTheme.normal || theme == WuiBadgeTheme.warning) {
      return Colors.black54;
    }
  }

  _textStyling(context) {
    TextStyle style = Theme.of(context).textTheme.bodyText2.copyWith(
      fontSize: 10,
      color: _getTextColors(theme)
    );
    return DefaultTextStyle(
      style: style,
      child: child
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _textStyling(context),
      padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
      decoration: BoxDecoration(
        color: _getColors(theme),
        borderRadius: BorderRadius.circular(8)
      ),
    );
  }
}