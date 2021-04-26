import 'package:flutter/material.dart';
import 'package:wui/widgets/button.widget.dart';

class WuiDialog extends StatelessWidget { 

  static Future<dynamic> open(BuildContext context, {
    required dynamic title,
    required dynamic message,
    List<dynamic>? buttons,
    int? defaultAction,
    EdgeInsets? insetPadding,
  }) async {
    
    return await showDialog(
      context: context,
      useRootNavigator: true,
      builder: (context) => AlertDialog(
        title: title is String ? Text(title) : title,
        content: message is String ? Text(message) : message,
        actions: List<Widget>.from(buttons!.asMap().map((index, item) {
          Widget widget = (item is String ? TextButton(
            child: DefaultTextStyle(
              style: Theme.of(context).textTheme.bodyText1!,
              child: Text(item),
            ),
            onPressed: () {
              Navigator.of(context).pop(index);
            },
          ) : item);
          return MapEntry(index, widget);
        }).values.toList())
      )
    );

  }

  final dynamic title;
  final Widget? child;
  final List<dynamic>? actions;
  final int? defaultActions;
  final Function(int)? onPressed;

  WuiDialog({
    this.title,
    this.child,
    this.actions,
    this.defaultActions,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      insetPadding: EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...[Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
            child: DefaultTextStyle(
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 20, 
                fontWeight: FontWeight.w500,
                color: Colors.black87
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: title is String ? Text(title) : title
              )
            ),
          )],
          ...[Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            child: child,
          )],
          ...[Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: List<Widget>.from(actions!.asMap().map((index, item) =>
                MapEntry(index, (item is String ? WuiButton(
                  size: WuiButtonSize.small,
                  isDense: true,
                  theme: defaultActions != null ? (defaultActions == index ? WuiButtonTheme.transparentPrimary : WuiButtonTheme.transparent) : WuiButtonTheme.transparent,
                  child: Text(actions![index]),
                  onPressed: () {
                    onPressed!(index);
                  },
                ) : item))
              ).values.toList())
            ),
          )]
        ],
      ),
    );
  }

}