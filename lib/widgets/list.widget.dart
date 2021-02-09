import 'package:flutter/material.dart';
import 'package:wui/widgets/list-tile.widget.dart';

class WuiList extends StatelessWidget {

  final List<Widget> children;
  final ScrollController controller;
  
  WuiList({
    this.controller,
    this.children
  });
  
  static builder({ScrollController controller, Function itemBuilder, int itemCount}) {
    return ListView.builder(
      controller: controller,
      itemBuilder: (context, index) {
        if(index < itemCount - 1) {
          return WuiListTileTheme(
            divider: true,
            child: itemBuilder(context, index)
          );
        }
        return itemBuilder(context, index);
      },
      itemCount: itemCount
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      children: children
    );
  }
}