import 'package:flutter/material.dart';

class WuiListTile extends StatelessWidget {

  final Function onTap;
  final Widget title;
  final Widget subtitle;
  final Widget leading;
  final Widget trailing;
  final bool isDense;
  final TextStyle titleTextStyle;

  WuiListTile({
    this.title,
    this.onTap,
    this.subtitle,
    this.leading,
    this.trailing,
    this.isDense,
    this.titleTextStyle
  });

  double _getMinHeight() {
    return (
      (isDense ?? false) ? (leading != null ? 56 : (
        trailing != null ? 56 : 48
      )) : (leading != null ? 72 : (
        trailing != null ? 72 : 48
      )
    ));
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0,
      highlightElevation: 0,
      padding: EdgeInsets.all(0),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            ...(leading != null ? [Container(
              padding: EdgeInsets.only(right: 32),
              child: Container(
                width: 32,
                height: 32,
                child: FittedBox(
                  alignment: Alignment.center,
                  fit: BoxFit.fill,
                  child: leading
                )
              )
            )] : []),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  title != null ? DefaultTextStyle(
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                      //fontSize: 16,
                      fontWeight: FontWeight.w600 
                    ).merge(titleTextStyle),
                    child: title
                  ) : Container(),
                  subtitle != null ? DefaultTextStyle(
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                      fontSize: 14
                    ),
                    child: subtitle
                  ) : Container()
                ],
              )
            ),
            Container(
              child: trailing
            )
          ],
        ),
      ),
      onPressed: onTap,
    );
  }
}