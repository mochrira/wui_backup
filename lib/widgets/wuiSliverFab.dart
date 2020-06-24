import 'package:flutter/material.dart';

class WuiSliverFab extends StatelessWidget {

  final ScrollController controller;

  WuiSliverFab({
    this.controller
  });

  _buildFab(BuildContext context) {
    double defaultTop = MediaQuery.of(context).size.width / 4 * 3;
    double top = defaultTop;
    double scaleStart = 96.0;
    double scaleEnd = scaleStart / 2;
    double scale = 1;

    if(controller.hasClients) {
      double offset = controller.offset;
      top -= controller.offset;
      if (offset < defaultTop - scaleStart) {
        scale = 1.0;
      } else if (offset < defaultTop - scaleEnd) {
        scale = (defaultTop - scaleEnd - offset) / scaleEnd;
      } else {
        scale = 0.0;
      }
    }

    return Positioned(
      right: 16,
      top: top,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          elevation: 4,
          shape: CircleBorder(),
          child: Icon(Icons.add, color: Colors.deepPurple, size: 28),
          backgroundColor: Colors.white,
          onPressed: () {},
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildFab(context);
  }
}