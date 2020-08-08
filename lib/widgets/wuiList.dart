import 'package:flutter/material.dart';

class WuiListView extends StatelessWidget {

  final List<Widget> children;
  WuiListView({
    this.children
  });
  
  static builder({Function itemBuilder, int itemCount}) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ListView.builder(
        itemBuilder: itemBuilder,
        itemCount: itemCount
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: ListView(
        children: children
      ),
    );
  }
}