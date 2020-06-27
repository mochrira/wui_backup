import 'package:flutter/material.dart';

class WuiListItem extends StatelessWidget {

  final Widget child;
  final Function onTap;

  WuiListItem({
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
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          trailing: Icon(Icons.more_horiz),
          title: child,
          onTap: onTap,
        )
      ),
    );
  }
}