import 'package:flutter/material.dart';

class WuiSelectorButton extends StatelessWidget {

  final Widget title;
  final Widget subtitle;
  final Icon icon;
  final String error;
  final Function onTap;

  WuiSelectorButton({
    this.title,
    this.subtitle,
    this.icon,
    this.error,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Colors.black26,
                offset: Offset(0, 2)
              )
            ]
          ),
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              RawMaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                elevation: 0,
                padding: EdgeInsets.all(16),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onPressed: () {
                  onTap();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          DefaultTextStyle(
                            style: Theme.of(context).textTheme.bodyText2.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87
                            ),
                            child: title
                          ),
                          DefaultTextStyle(
                            style: Theme.of(context).textTheme.bodyText2,
                            child: subtitle
                          )
                        ],
                      ),
                    ),
                    icon
                  ],
                ),
              ),
            ],
          ),
        ),
        error != null ? Padding(
          padding: EdgeInsets.fromLTRB(32, 0, 32, 16),
          child: DefaultTextStyle(
            style: Theme.of(context).textTheme.bodyText2.copyWith(
              color: Colors.red[400],
              fontSize: 12
            ),
            softWrap: true,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.error, color: Colors.red[300]),
                ),
                Expanded(
                  child: Text(error)
                )
              ],
            )
          )
        ) : Container()
      ],
    );
  }
}