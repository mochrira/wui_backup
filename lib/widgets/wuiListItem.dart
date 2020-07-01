import 'package:flutter/material.dart';

class WuiListItem extends StatelessWidget {

  final Widget child;
  final Function onTap;
  final Widget trailing;
  final Widget title;
  final Widget subtitle;
  final Widget leading;

  WuiListItem({
    this.title,
    this.child,
    this.trailing,
    this.onTap,
    this.subtitle,
    this.leading
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        child: RawMaterialButton(
          constraints: BoxConstraints(
            minHeight: 64
          ),
          padding: EdgeInsets.symmetric(horizontal: 16),
          onPressed: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              leading != null ? Padding(
                padding: EdgeInsets.only(right: 24),
                child: leading
              ) : Container() ?? Container(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    (title is Text ? Text(
                      (title as Text).data, style: Theme.of(context).textTheme.bodyText2.copyWith()
                    ) : title) ?? Container(),
                    SizedBox(height: 4),
                    (subtitle is Text ? Text(
                      (subtitle as Text).data, style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600
                      )
                    ) : subtitle) ?? Container()
                  ],
                ),
              ),
              trailing ?? Container()
            ],
          ),
        )
      ),
    );
  }
}