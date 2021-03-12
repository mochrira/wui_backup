import 'package:flutter/material.dart';
import 'package:wui/widgets/list-tile.widget.dart';

class WuiSliverList extends StatelessWidget {

  final Function? builder;
  final int? itemCount;
  WuiSliverList({
    this.builder,
    this.itemCount
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, index) {
          Widget? item = builder!(context, index);
          return WuiListTileTheme(
            borderMode: WuiListTileBorderMode.full,
            divider: (index < itemCount! - 1 ? true : false),
            child: item
          );
        },
        childCount: itemCount
      ),
    );
  }
}