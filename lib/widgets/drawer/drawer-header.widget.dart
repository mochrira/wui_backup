import 'package:flutter/material.dart';

import 'drawer.widget.dart';

class WuiDrawerHeaderDecoration {

  String userName;
  String email;
  Widget photo;
  Icon trailingMainIcon;
  Icon trailingUserIcon;

  WuiDrawerHeaderDecoration({
    this.userName,
    this.email,
    this.photo,
    this.trailingMainIcon,
    this.trailingUserIcon
  });

}

class WuiDrawerHeader extends StatelessWidget {
  
  final Function onPressed;
  final WuiDrawerMenuType menuType;
  final WuiDrawerHeaderDecoration decoration;
  WuiDrawerHeader({
    this.menuType,
    this.onPressed,
    this.decoration
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Container(
            width: 80,
            height: 80,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48),
              color: Colors.grey[200]
            ),
            child: decoration?.photo
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Material(
            child: RawMaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              ),
              padding: EdgeInsets.all(8),
              onPressed: onPressed,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(decoration?.userName ?? 'User Name', style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87
                        )),
                        Text(decoration?.email ?? 'user@email.com', style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54
                        ))
                      ],
                    ),
                  ),
                  (menuType == WuiDrawerMenuType.main ? Icon(
                    Icons.arrow_drop_down
                  ) : Icon(
                    Icons.arrow_drop_up
                  ))
                ],
              )
            )
          ),
        ),
        Divider()
      ],
    );
  }
}