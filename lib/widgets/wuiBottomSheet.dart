import 'package:flutter/material.dart';
import 'package:wui/widgets/wuiListItem.dart';

class WuiBottomSheetItem {

  final Widget child;
  final Widget trailing;
  final Widget leading;
  final Widget title;
  final Widget subtitle;
  final bool danger;
  final Function onPressed;
  dynamic value;

  WuiBottomSheetItem({
    this.leading,
    this.trailing,
    this.child,
    this.title,
    this.subtitle,
    this.danger = false,
    this.onPressed,
    this.value
  });

}

class WuiModalBottomSheet {

  static Future<int> open(BuildContext context, {
    Widget title,
    bool useRootNavigator = true,
    List<WuiBottomSheetItem> actions
  }) async {
    return await showModalBottomSheet(
      context: context,
      useRootNavigator: useRootNavigator,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              (title != null ? Padding(
                padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
                child: DefaultTextStyle(child: title, style: Theme.of(context).textTheme.bodyText2.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ))
              ) : Container()),
              ...(actions.asMap().map((index, item) {
                return MapEntry(index, WuiListTile(
                  isDense: true,
                  leading: item.leading,
                  title: item.title,
                  subtitle: item.subtitle,
                  trailing: item.trailing,
                  titleTextStyle: TextStyle(
                    fontWeight: FontWeight.w600
                  ),
                  onTap: () {
                    Navigator.of(context).pop(index);
                  },
                ));
              }).values.toList())
            ],
          ),
        );
      }
    );
  } 

}