import 'package:flutter/material.dart';

enum WuiListTileHeight {h24, h32, h48, h56, h64, h72, h80, h88}
const List<double> WuiListTileHeightValue = [24, 32, 48, 56, 64, 72, 80, 88];
enum WuiListTileBorderMode {normal, full}
enum WuiListTileMode {normal, fieldValue}

class WuiListTileTheme extends StatelessWidget {

  final bool? divider;
  final TextStyle? titleTextStyle;

  final TextStyle? subtitleTextStyle;
  final WuiListTileBorderMode? borderMode;
  final WuiListTileHeight? heightMode;
  final Widget? child;
  final WuiListTileMode? mode;

  WuiListTileTheme({
    this.divider,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.borderMode,
    this.heightMode,
    this.child,
    this.mode
  });

  @override
  Widget build(BuildContext context) => child!;
}

class WuiListTile extends StatelessWidget {

  final Key? key;
  final Widget? trailing;
  final Widget? title;
  final Widget? subtitle;
  final Widget? field;
  final Widget? value;
  final Widget? leading;
  final Function? onTap;
  final WuiListTileHeight? heightMode;
  final WuiListTileBorderMode? borderMode;
  final WuiListTileMode? mode;
  final bool? divider;

  WuiListTile({
    this.key,
    this.leading,
    this.title,
    this.subtitle,
    this.field,
    this.value,
    this.trailing,
    this.onTap,
    this.heightMode,
    this.borderMode,
    this.divider,
    this.mode
  });

  @override
  Widget build(BuildContext context) {

    bool? _divider = false;
    WuiListTileBorderMode? _borderMode = WuiListTileBorderMode.normal;
    WuiListTileHeight? _heightMode = WuiListTileHeight.h72;
    WuiListTileMode? _mode = WuiListTileMode.normal;

    TextStyle? _titleTextStyle = Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500, fontSize: 16);
    TextStyle? _subtitleTextStyle = Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.normal);
    TextStyle _fieldTextStyle = Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black54);

    WuiListTileTheme? theme = context.findAncestorWidgetOfExactType<WuiListTileTheme>();
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
      if(theme.mode != null) {
        _mode = theme.mode;
      }
    }

    if(divider != null) {
      _divider = divider;
    }
    if(borderMode != null) {
      _borderMode = borderMode;
    }
    if(heightMode != null) {
      _heightMode = heightMode;
    }
    if(mode != null) {
      _mode = mode;
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
      highlightElevation: 0,
      onPressed: onTap as void Function()?,
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: _divider! ? (_borderMode == WuiListTileBorderMode.full ? BorderSide(
            color: Colors.black.withOpacity(.08)
          ) : BorderSide.none) : BorderSide.none)
        ),
        height: WuiListTileHeightValue[_heightMode!.index],
        padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...(leading != null ? [Container(
              constraints: BoxConstraints(
                minWidth: 56
              ),
              padding: EdgeInsets.only(right: 16),
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
                      child: _mode == WuiListTileMode.normal ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ...(title != null ? [DefaultTextStyle(style: _titleTextStyle!, child: title!)] : []),
                          ...(subtitle != null ? [DefaultTextStyle(style: _subtitleTextStyle!, child: subtitle!)] : [])
                        ],
                      ) : Row(
                        children: [
                          ... (field != null ? [DefaultTextStyle(style: _fieldTextStyle, child: field!)] : []),
                          ... (value != null ? [Expanded(
                            child: DefaultTextStyle(
                              style: _titleTextStyle!, 
                              textAlign: TextAlign.right, 
                              child: value!
                            ))] : [])
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