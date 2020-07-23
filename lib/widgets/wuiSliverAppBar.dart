import 'package:flutter/material.dart';
import 'package:wui/widgets/wuiPageTitle.dart';

class WuiSliverAppBar extends StatelessWidget {

  final List<Widget> actions;
  final String title;
  final dynamic subTitle;
  final Widget bottom;
  final bool showExpandedArea;
  final Widget leading;
  final Widget titleWidget;

  WuiSliverAppBar({
    this.title,
    this.subTitle,
    this.actions,
    this.bottom,
    this.showExpandedArea = true,
    this.leading,
    this.titleWidget
  });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: double.minPositive,
      child: SliverAppBar(
        title: titleWidget,
        actions: actions,
        centerTitle: true,
        pinned: true,
        elevation: 2,
        bottom: bottom,
        leading: leading,
        expandedHeight: showExpandedArea ? MediaQuery.of(context).size.width / 4 * 3 : 0,
        flexibleSpace: FlexibleSpaceBar(
          background: SafeArea(
            child: Container(
              padding: EdgeInsets.fromLTRB(24, 80, 24, 24),
              child: Center(
                child: WuiPageTitle(
                  title: title,
                  subTitle: subTitle,
                )
              )),
          )
        )
      ),
    );
  }
}