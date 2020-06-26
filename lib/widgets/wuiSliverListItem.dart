import 'package:flutter/material.dart';

class WuiSliverListItem extends StatelessWidget {

  final Widget child;
  final Function onTap;

  WuiSliverListItem({
    this.child,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        child: ListTile(
          trailing: Icon(Icons.more_horiz),
          title: child,
          onTap: onTap,
        )
      ),
    );
  }
}