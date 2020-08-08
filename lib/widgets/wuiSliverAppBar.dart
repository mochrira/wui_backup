import 'package:flutter/material.dart';
import 'package:wui/widgets/wuiPageTitle.dart';

class WuiSliverAppBar extends StatefulWidget {

  final List<Widget> actions;
  final Widget title;
  final Widget subtitle;
  final ScrollController controller;

  WuiSliverAppBar({
    @required this.controller,
    this.title,
    this.subtitle,
    this.actions, String subTitle
  });

  @override
  _WuiSliverAppBarState createState() => _WuiSliverAppBarState();
}

class _WuiSliverAppBarState extends State<WuiSliverAppBar> with SingleTickerProviderStateMixin {

  bool _visible = false;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      animationBehavior: AnimationBehavior.normal,
      vsync: this
    );
    widget.controller.addListener(() { 
      if(widget.controller.offset >= 244) {
        if(_visible == false) {
          setState(() { _visible = true; });
          _animationController.forward();
        }
      } else {
        if(_visible == true) {
          setState(() { _visible = false; });
          _animationController.reverse();
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      pinned: true,
      actions: widget.actions,
      expandedHeight: 300,
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
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 56),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  widget.title != null ? DefaultTextStyle(
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.w600
                    ),
                    child: widget.title
                  ) : Container(),
                  widget.subtitle != null ? DefaultTextStyle(
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.normal
                    ),
                    child: widget.subtitle
                  ) : Container()
                ],
              )
            )
          ),
        ),
      ),
    );
  }
}