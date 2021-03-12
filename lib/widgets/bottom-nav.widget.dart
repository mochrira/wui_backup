import 'package:flutter/material.dart';

class WuiBottomNavigationBarItem {

  final IconData? icon;
  final String? label;

  WuiBottomNavigationBarItem({
    this.icon,
    this.label
  });
}

class WuiBottomNavigationBar extends StatelessWidget {

  final double notchMargin;
  final NotchedShape? shape;
  final List<WuiBottomNavigationBarItem>? items;
  final Function(int index)? onItemTap;
  final int activeIndex;
  
  WuiBottomNavigationBar({
    this.notchMargin = 12,
    this.shape,
    this.items,
    this.onItemTap,
    this.activeIndex = 0
  });

  _getTextColor(BuildContext context, index) {
    if(activeIndex == index) {
      return Theme.of(context).primaryColor;
    }
    return Theme.of(context).textTheme.bodyText2!.color;
  }

  _buildItems(BuildContext context) {
    List<Widget> localItems = [];
    bool hasMiddle = false;
    for(int i = 0; i < items!.length; i++) {
      localItems.add(
        SizedBox(
          height: 64,
          width: 64,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(32),
              onTap: () {
                onItemTap!(i);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(items![i].icon, color: _getTextColor(context, i)),
                  Text(items![i].label!, 
                    overflow: TextOverflow.visible, 
                    softWrap: false, 
                    style: TextStyle(
                      fontSize: 12,
                      color: _getTextColor(context, i)
                    )
                  )
                ],
              )
            )
          )
        )
      );
      if(!hasMiddle && ((i + 1) == (items!.length / 2).floor())) {
        localItems.add(SizedBox(
          height: 48,
          width: 64,
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
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _buildItems(context),
        ),
      )
    );
  }
}