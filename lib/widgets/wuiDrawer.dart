import 'package:flutter/material.dart';
import 'package:wui/wui.dart';

enum WuiDrawerItemType { button, label, divider }
enum WuiDrawerMenuType { main, user }

class WuiDrawerItem {

  WuiDrawerItemType type;
  String captionText;
  Icon icon;
  Function onPressed;
  bool active;

  WuiDrawerItem({
    this.type,
    this.captionText,
    this.icon,
    this.onPressed,
    this.active
  });

}

class WuiDrawerButton extends StatelessWidget {

  final String caption;
  final Icon icon;
  final Function onPressed;
  final bool active;

  WuiDrawerButton({
    this.caption,
    this.icon,
    this.onPressed,
    this.active
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      height: 48,
      child: RawMaterialButton(
        fillColor: (active == true ? 
          Colors.deepPurple.withOpacity(.2) : 
          Colors.transparent),
        elevation: 0,
        highlightElevation: 0,
        disabledElevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 24),
              child: IconTheme(
                data: IconThemeData(
                  color: active ? Colors.deepPurple : Colors.black.withOpacity(.8)
                ),
                child: icon
              )
            ),
            Text(caption, 
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                color: active ? Colors.deepPurple : Colors.black.withOpacity(.8),
                fontWeight: FontWeight.w500
              )
            )
          ],
        ),
        onPressed: onPressed,
      )
    );
  }
}

class WuiDrawerHeaderDecoration {

  String userName;
  String email;
  String photoUrl;
  Icon trailingMainIcon;
  Icon trailingUserIcon;

  WuiDrawerHeaderDecoration({
    this.userName,
    this.email,
    this.photoUrl,
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
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Colors.grey[200]
            )
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
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87
                        )),
                        Text(decoration?.userName ?? 'user@email.com', style: TextStyle(
                          fontSize: 12,
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
      ],
    );
  }
}

class WuiDrawer extends StatefulWidget {

  final BuildContext context;
  final bool showHeader;
  final WuiDrawerHeaderDecoration headerDecoration;

  final List<WuiDrawerItem> mainMenu;
  final List<WuiDrawerItem> userMenu;

  WuiDrawer({
    this.context,
    this.showHeader,
    this.headerDecoration,

    this.mainMenu,
    this.userMenu,
  });

  @override
  _WuiDrawerState createState() => _WuiDrawerState();
}

class _WuiDrawerState extends State<WuiDrawer> {

  ConfigService _configService = ConfigService();
  WuiDrawerMenuType _menuType;

  int _getItemCount() {
    return (
      _menuType == WuiDrawerMenuType.main ? 
      widget.mainMenu.length : 
      widget.userMenu.length
    );
  }

  List<WuiDrawerItem> _getItems() {
    return (
      _menuType == WuiDrawerMenuType.main ? 
      widget.mainMenu : 
      widget.userMenu
    );
  }

  bool _isActive(index) {
    if(_configService.getValue('wuiDrawerMenuType') != _menuType) {
      return false;
    }
    
    if(_configService.getValue('wuiDrawerMenuType') == WuiDrawerMenuType.main) {
      return (_configService.getValue('wuiDrawerMainSelected') == index);
    } else {
      return (_configService.getValue('wuiDrawerUserSelected') == index);
    }
  }

  @override
  void initState() {
    super.initState();
    _menuType = _configService.getValue('wuiDrawerMenuType') ?? WuiDrawerMenuType.main;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.black54
          )
        )
      ),
      child: Drawer(
        child: ListView.builder(
          itemCount: widget.showHeader != null ? _getItemCount() + 1 : _getItemCount(),
          itemBuilder: (_, index) {
            List<WuiDrawerItem> items = _getItems();

            if(widget.showHeader != null && index == 0) {
              return WuiDrawerHeader(
                decoration: widget.headerDecoration,
                menuType: _menuType,
                onPressed: () {
                  setState(() {
                    _menuType = (_menuType == WuiDrawerMenuType.main ? WuiDrawerMenuType.user : WuiDrawerMenuType.main);
                  });
                },
              );
            }

            int currentIndex = (widget.showHeader != null ? index-1 : index);
            if(items[currentIndex].type == WuiDrawerItemType.button) {
              return WuiDrawerButton(
                caption: items[currentIndex].captionText,
                icon: items[currentIndex].icon,
                active: _isActive(currentIndex),
                onPressed: () {
                  _configService.addValue('wuiDrawerMenuType', _menuType);
                  if(_menuType == WuiDrawerMenuType.main) {
                    _configService.addValue('wuiDrawerMainSelected', currentIndex);
                  } else {
                    _configService.addValue('wuiDrawerUserSelected', currentIndex);
                  }
                  setState(() {});
                  Navigator.of(context).pop();
                  if(items[currentIndex].onPressed != null) {
                    items[currentIndex].onPressed();
                  }
                }
              );
            }

            if(items[currentIndex].type == WuiDrawerItemType.label) {
              return Padding(
                padding: EdgeInsets.only(
                  top: 14, bottom: 4, right: 16, left: 16
                ),
                child: Text(items[currentIndex].captionText, 
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500
                  )
                )
              );
            }

            return Divider();
          },
        ),
      )
    );
  }
}