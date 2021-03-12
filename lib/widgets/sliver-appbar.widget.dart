import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wui/colors/primary.color.dart';

class WuiSliverAppBar extends StatefulWidget {

  final List<Widget>? actions;
  final Widget? floatingTitle;
  final Widget? title;
  final Widget? subtitle;
  final PreferredSizeWidget? bottom;
  final bool showExpanded;

  WuiSliverAppBar({
    this.floatingTitle,
    this.title,
    this.subtitle,
    this.actions,
    this.bottom,
    this.showExpanded = true
  });

  @override
  _WuiSliverAppBarState createState() => _WuiSliverAppBarState();
}

class _WuiSliverAppBarState extends State<WuiSliverAppBar> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  double _flexOpacity = 1;
  Timer? _sizeChangeDebounce;
  GlobalKey _sizeChangeKey = GlobalKey();
  double _maxHeight = 0;
  double _appBarHeight = 0;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      animationBehavior: AnimationBehavior.normal
    );
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _appBarHeight = 56 + (widget.bottom?.preferredSize.height ?? 0) + MediaQuery.of(context).padding.top;
      _maxHeight = _sizeChangeKey.currentContext!.size!.height - _appBarHeight;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: surfaceColor,
      actions: widget.actions,
      title: widget.floatingTitle != null ? widget.floatingTitle : AnimatedBuilder(
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
      expandedHeight: widget.showExpanded ? MediaQuery.of(context).size.height / 2 : 0,
      bottom: widget.bottom,
      flexibleSpace: NotificationListener(
        onNotification: (SizeChangedLayoutNotification notification) {
          double currentHeight = _sizeChangeKey.currentContext!.size!.height - _appBarHeight;
          double opacity = (currentHeight / _maxHeight);
          if(_sizeChangeDebounce != null) _sizeChangeDebounce!.cancel();
          _sizeChangeDebounce = Timer(Duration.zero, () {
              setState(() { _flexOpacity = opacity; });
              if(_flexOpacity == 0) {
                _animationController.forward();
                return;
              }
              _animationController.reverse();
          });
          return true;
        },
        child: Opacity(
          opacity: _flexOpacity,
          child: SizeChangedLayoutNotifier(
            key: _sizeChangeKey,
            child: Container(
              padding: EdgeInsets.only(top: 56),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DefaultTextStyle(
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w500
                      ), 
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 340
                        ),
                        child: widget.title
                      )
                    ),
                    SizedBox(height: 8),
                    DefaultTextStyle(
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 16
                      ), 
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 300
                        ),
                        child: widget.subtitle
                      )
                    ),
                  ],
                )
              )
            ),
          )
        ),
      ),
    );
  }
}