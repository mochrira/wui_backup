import 'package:flutter/material.dart';

class WuiListTile extends StatelessWidget {

  final Function onTap;
  final Widget title;
  final Widget subtitle;

  WuiListTile({
    this.title,
    this.onTap,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          title: title,
          subtitle: subtitle,
          onTap: onTap,
        )
      ),
    );
  }
}