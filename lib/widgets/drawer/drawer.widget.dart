import 'package:flutter/material.dart';
import 'package:wui/wui.dart';
import 'drawer-header.widget.dart';
import 'drawer-button.widget.dart';

enum WuiDrawerMenuType { main, user }

class WuiDrawer extends StatelessWidget {

  final BuildContext? context;
  final WuiDrawerHeader? header;
  final WuiDrawerMenuType? menuType;
  final List<WuiDrawerItem>? userMenu;
  final List<WuiDrawerItem>? mainMenu;
  final String? activeName;

  WuiDrawer({
    this.context,
    this.header,
    this.menuType,
    this.userMenu,
    this.mainMenu,
    this.activeName
  });

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView(
        children: [
          header ?? Container(),
          ...(menuType == WuiDrawerMenuType.main ? mainMenu : userMenu)!.asMap().map((key, value) {

            Widget? item;

            if(value.type == WuiDrawerItemType.button) {
              item = WuiDrawerButton(
                caption: value.captionText,
                icon: value.icon,
                active: activeName != null ? activeName == value.name : false,
                onPressed: () {
                  Navigator.of(context).pop();
                  value.onPressed!();
                }
              );
            }

            if(value.type == WuiDrawerItemType.label) {
              item = Padding(
                padding: EdgeInsets.only(
                  top: 24, bottom: 8, right: 16, left: 16
                ),
                child: Text(value.captionText!, 
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Colors.black.withOpacity(.5),
                    fontWeight: FontWeight.w500,
                    fontSize: 12
                  )
                )
              );
            }

            if(value.type == WuiDrawerItemType.divider) {
              item = Divider();
            }

            return MapEntry(
              key, item
            );
          }).values.toList() as Iterable<Widget>
        ]
      ),
    );

  }
}