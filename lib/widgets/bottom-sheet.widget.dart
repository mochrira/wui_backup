import 'package:flutter/material.dart';
import 'package:wui/widgets/list-tile.widget.dart';

class WuiBottomSheetItem {

  final Widget? trailing;
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final bool danger;
  final Function? onTap;
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

  static Future<int?> open(BuildContext context, {
    bool useRootNavigator = true,
    required Widget child,
  }) async {
    return await showModalBottomSheet(
      context: context,
      useRootNavigator: useRootNavigator,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        )
      ),
      builder: (_) => Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: Container(
                  width: 80,
                  height: 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.grey[300]
                  )
                )
              )
            ),
            child
          ],
        )
      )
    );
  } 

}