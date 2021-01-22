import 'package:flutter/material.dart';

class WuiDialog {

  static Future<dynamic> open(BuildContext context, {
    @required dynamic title,
    @required dynamic message,
    @required List<dynamic> buttons,
    int defaultAction,
    EdgeInsets insetPadding,
  }) async {
    
    return await showDialog(
      context: context,
      useRootNavigator: true,
      builder: (context) => AlertDialog(
        title: title is String ? Text(title) : title,
        content: message is String ? Text(message) : message,
        actions: buttons.asMap().map((index, item) {
          Widget widget;
          
          if(buttons[index] is String) {
            widget = FlatButton(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 0),
              textTheme: defaultAction == index ? ButtonTextTheme.primary : ButtonTextTheme.normal,
              child: DefaultTextStyle(
                style: Theme.of(context).textTheme.bodyText1,
                child: Text(buttons[index])
              ),
              onPressed: () {
                Navigator.of(context).pop(index);
              },
            );
          }
          
          if(buttons[index] is Widget) {
            widget = Theme(
              data: Theme.of(context).copyWith(
                buttonTheme: ButtonThemeData(
                  textTheme: defaultAction == index ? ButtonTextTheme.primary : ButtonTextTheme.normal,
                ),
              ),
              child: widget
            );
          }

          return MapEntry(index, widget);
        }).values.toList()
      )
    );

  }

}