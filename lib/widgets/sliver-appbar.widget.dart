import 'package:flutter/material.dart';

class WuiSliverAppBar extends StatefulWidget {

  final List<Widget> actions;
  final Widget title;
  final Widget subtitle;
  final ScrollController controller;
  final BuildContext context;

  WuiSliverAppBar({
    @required this.controller,
    @required this.context,
    this.title,
    this.subtitle,
    this.actions,
  });

  @override
  _WuiSliverAppBarState createState() => _WuiSliverAppBarState();
}

class _WuiSliverAppBarState extends State<WuiSliverAppBar> with SingleTickerProviderStateMixin {

  AnimationController _animationController;
  double _flexOpacity = 1;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      animationBehavior: AnimationBehavior.normal
    );
    widget.controller.addListener(() { 
      if(this.mounted) {
        double max = ((MediaQuery.of(widget.context).size.height / 2) - 56) - 32;
        if(widget.controller.offset > max) {
          setState(() { _flexOpacity = 0; });
          _animationController.forward();
        } else {
          setState(() { _flexOpacity = (max - widget.controller.offset) / max; });
          _animationController.reverse();
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actions: widget.actions,
      title: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Opacity(
            opacity: _animationController.value,
            child: Transform.translate(
              offset: Offset(0, 24 - (_animationController.value * 24)),
              child: widget.title
            )
          );
        },
      ),
      floating: false,
      pinned: true,
      expandedHeight: (MediaQuery.of(context).size.height / 2),
      flexibleSpace: Container(
        padding: EdgeInsets.only(top: 56),
        child: Center(
          child: Opacity(
            opacity: _flexOpacity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.headline4.copyWith(
                    fontSize: 28
                  ), 
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 340
                    ),
                    child: widget.title
                  )
                ),
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.bodyText2, 
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 340
                    ),
                    child: widget.subtitle
                  )
                ),
              ],
            ),
          )
        )
      ),
    );
  }
}