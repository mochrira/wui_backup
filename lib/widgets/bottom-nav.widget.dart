import 'package:flutter/material.dart';

class WuiBottomNavigationBarItem extends StatelessWidget {

  final Widget icon;
  final String label;
  final Function onTap;

  WuiBottomNavigationBarItem({
    this.icon,
    this.label,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: 56,
      child: Material(
        child: InkWell(
          borderRadius: BorderRadius.circular(28),
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              Text(label, overflow: TextOverflow.visible, softWrap: false, style: TextStyle(
                fontSize: 12
              ))
            ],
          )
        )
      )
    );
  }
}

class WuiBottomNavigationBar extends StatelessWidget {

  final double notchMargin;
  final NotchedShape shape;
  final List<WuiBottomNavigationBarItem> items;
  
  WuiBottomNavigationBar({
    this.notchMargin = 4,
    this.shape,
    this.items
  });

  _buildItems() {
    List<Widget> localItems = [];
    bool hasMiddle = false;
    for(int i = 0; i < items.length; i++) {
      localItems.add(items[i]);
      if(!hasMiddle && ((i + 1) == (items.length / 2).floor())) {
        localItems.add(SizedBox(
          height: 56,
          width: 56,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 24),
              Text('')
            ],
          )
        ));
        hasMiddle = true;
      }
    }
    return localItems;
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      clipBehavior: Clip.antiAlias,
      notchMargin: notchMargin,
      shape: shape,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: _buildItems(),
        ),
      )
    );
  }
}