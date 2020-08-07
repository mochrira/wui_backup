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
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          title: title,
          subtitle: subtitle,
          onTap: () {},
        )
      ),
    );
  }
}