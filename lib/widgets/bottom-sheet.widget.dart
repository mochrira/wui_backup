import 'package:flutter/material.dart';
import 'package:wui/widgets/list-tile.widget.dart';

class WuiBottomSheetItem {

  final Widget trailing;
  final Widget leading;
  final Widget title;
  final Widget subtitle;
  final bool danger;
  final Function onTap;
  dynamic value;

  WuiBottomSheetItem({
    this.leading,
    this.trailing,
    this.title,
    this.subtitle,
    this.danger = false,
    this.onTap,
    this.value
  });

}

class WuiBottomSheet {

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
              ...(title != null ? [Container(
                padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
                child: DefaultTextStyle(
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                  child: title
                )
              )] : []),
              ...(actions.asMap().map((index, item) {
                return MapEntry(index, WuiListTile(
                  heightMode: WuiListTileHeight.h48,
                  divider: true,
                  leading: item.leading,
                  title: item.title,
                  subtitle: item.subtitle,
                  trailing: item.trailing,
                  onTap: () {
                    if(item.onTap == null) {
                      Navigator.of(context).pop(index);
                      return;
                    }
                    item.onTap();
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