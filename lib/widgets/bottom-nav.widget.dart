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
    return Expanded(
      child: SizedBox(
        height: 64,
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: onTap,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                SizedBox(height: 4),
                Text(label, style: TextStyle(
                  fontSize: 12
                ))
              ],
            )
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
        localItems.add(Expanded(
          child: SizedBox(
            height: 60,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 24),
                Text('')
              ],
            )
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: _buildItems(),
      )
    );
  }
}