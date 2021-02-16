import 'package:flutter/material.dart';

enum WuiListTileHeight {h24, h32, h48, h56, h64, h72, h80, h88}
const List<double> WuiListTileHeightValue = [24, 32, 48, 56, 64, 72, 80, 88];
enum WuiListTileBorderMode {normal, full}

class WuiListTileTheme extends StatelessWidget {

  final bool divider;
  final TextStyle titleTextStyle;

  final TextStyle subtitleTextStyle;
  final WuiListTileBorderMode borderMode;
  final WuiListTileHeight heightMode;
  final Widget child;

  WuiListTileTheme({
    this.divider,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.borderMode,
    this.heightMode,
    this.child
  });

  @override
  Widget build(BuildContext context) => child;
}

class WuiListTile extends StatelessWidget {

  final Key key;
  final Widget trailing;
  final Widget title;
  final Widget subtitle;
  final Widget leading;
  final Function onTap;
  final WuiListTileHeight heightMode;
  final WuiListTileBorderMode borderMode;
  final bool divider;

  WuiListTile({
    this.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.heightMode = WuiListTileHeight.h64,
    this.borderMode = WuiListTileBorderMode.normal,
    this.divider = false
  });

  @override
  Widget build(BuildContext context) {

    bool _divider = divider;
    WuiListTileBorderMode _borderMode = borderMode;
    WuiListTileHeight _heightMode = heightMode;

    TextStyle _titleTextStyle = Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.w500);
    TextStyle _subtitleTextStyle = Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.normal);

    WuiListTileTheme theme = context.findAncestorWidgetOfExactType<WuiListTileTheme>();
    if(theme != null) {
      if(theme.divider != null) {
        _divider = theme.divider;
      }
      if(theme.borderMode != null) {
        _borderMode = theme.borderMode;
      }
      if(theme.titleTextStyle != null) {
        _titleTextStyle = theme.titleTextStyle;
      }
      if(theme.subtitleTextStyle != null) {
        _subtitleTextStyle = theme.subtitleTextStyle;
      }
      if(theme.heightMode != null) {
        _heightMode = theme.heightMode;
      }
    }

    return RawMaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      constraints: BoxConstraints(
        minHeight: 0
      ),
      fillColor: Colors.white,
      padding: EdgeInsets.all(0),
      focusColor: Colors.black.withOpacity(.12),
      highlightColor: Colors.black.withOpacity(.08),
      splashColor: Colors.black.withOpacity(.04),
      elevation: 0,
      focusElevation: 0,
      onPressed: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: _divider ? (_borderMode == WuiListTileBorderMode.full ? BorderSide(
            color: Colors.black.withOpacity(.08)
          ) : BorderSide.none) : BorderSide.none)
        ),
        height: WuiListTileHeightValue[_heightMode.index],
        padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...(leading != null ? [Container(
              width: 56,
              alignment: Alignment.centerLeft,
              child: leading
            )] : []),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(bottom: _divider ? (_borderMode == WuiListTileBorderMode.normal ? BorderSide(
                    color: Colors.black.withOpacity(.08)
                  ) : BorderSide.none) : BorderSide.none)
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ...(title != null ? [DefaultTextStyle(style: _titleTextStyle, child: title)] : []),
                          ...(subtitle != null ? [DefaultTextStyle(style: _subtitleTextStyle, child: subtitle)] : [])
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 16),
                      child: trailing != null ? Container(
                        padding: EdgeInsets.only(left: 16),
                        child: trailing
                      ) : null
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}