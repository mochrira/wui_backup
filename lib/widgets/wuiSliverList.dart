import 'package:flutter/material.dart';

class WuiSliverList extends StatelessWidget {

  final Function builder;
  final int itemCount;
  WuiSliverList({
    this.builder,
    this.itemCount
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, index) {
          Widget item = builder(context, index);

          if(index == itemCount - 1) {
            return Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: item
            );
          }

          return item;
        },
        childCount: itemCount
      ),
    );
  }
}