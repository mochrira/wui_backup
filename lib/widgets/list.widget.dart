import 'package:flutter/material.dart';
import 'package:wui/widgets/list-tile.widget.dart';

class WuiList extends StatelessWidget {

  final List<Widget> children;
  WuiList({
    this.children
  });
  
  static builder({Function itemBuilder, int itemCount}) {
    return ListView.builder(
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
      children: children
    );
  }
}