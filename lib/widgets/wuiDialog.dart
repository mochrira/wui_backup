import 'package:flutter/material.dart';

class WuiDialog {

  static Future<dynamic> open(BuildContext context, {
    @required dynamic title,
    @required dynamic message,
    @required List<dynamic> actions,
    int defaultAction
  }) async {
    
    return await showDialog(
      context: context,
      useRootNavigator: true,
      builder: (context) => AlertDialog(
        title: title is String ? Text(title) : title,
        content: message is String ? Text(message) : message,
        actions: actions.asMap().map((index, item) {
          Widget widget;

          if(actions[index] is String) {
            widget = FlatButton(
              textTheme: defaultAction == index ? ButtonTextTheme.primary : ButtonTextTheme.normal,
              child: Text(actions[index]),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop(index);
              },
            );
          }
          
          if(actions[index] is Widget) {
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