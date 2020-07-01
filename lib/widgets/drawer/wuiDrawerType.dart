import 'package:flutter/material.dart';

enum WuiDrawerItemType { button, label, divider }
enum WuiDrawerMenuType { main, user }

class WuiDrawerItem {

  WuiDrawerItemType type;
  String name;
  String captionText;
  Icon icon;
  Function onPressed;

  WuiDrawerItem({
    this.type,
    this.captionText,
    this.icon,
    this.onPressed,
    this.name
  });

}