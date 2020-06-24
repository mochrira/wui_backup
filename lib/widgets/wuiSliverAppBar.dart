import 'package:flutter/material.dart';
import 'package:wui/widgets/wuiPageTitle.dart';

class WuiSliverAppBar extends StatelessWidget {

  List<Widget> actions;
  String title;
  String subTitle;

  WuiSliverAppBar({
    this.title,
    this.subTitle,
    this.actions
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actions: actions,
      centerTitle: true,
      pinned: true,
      elevation: 2,
      expandedHeight: MediaQuery.of(context).size.width / 4 * 3,
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Container(
            padding: EdgeInsets.all(24),
            child: Center(
              child: WuiPageTitle(
                title: title,
                subTitle: subTitle,
              )
            )),
        )
      )
    );
  }
}