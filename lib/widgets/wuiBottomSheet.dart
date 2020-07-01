import 'package:flutter/material.dart';

class WuiBottomSheetItem {

  final Widget child;
  final Widget trailing;
  final Widget leading;
  final bool danger;
  final Function onPressed;
  dynamic value;

  WuiBottomSheetItem({
    this.leading,
    this.trailing,
    this.child,
    this.danger = false,
    this.onPressed,
    this.value
  });

}

class WuiModalBottomSheet {

  static Future<int> open({
    @required BuildContext context,
    bool useRootNavigator = true,
    List<WuiBottomSheetItem> actions
  }) async {
    return await showModalBottomSheet(
      context: context,
      useRootNavigator: useRootNavigator,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return Container(
          padding: EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16)
            )
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Container(
                    width: 50,
                    height: 6,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(3)
                    ),
                  )
                )
              ),
              ...(actions.asMap().map((index, item) {
                return MapEntry(index, Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  child: RawMaterialButton(
                    padding: EdgeInsets.symmetric(
                      vertical: 12, 
                      horizontal: 8
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 16),
                          child: item.leading != null ? Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: item.leading
                          ) : null
                        ),
                        Expanded(
                          child: item.child
                        ),
                        item.trailing ?? Container(),
                      ],
                    ),
                    onPressed: item.onPressed ?? () {
                      Navigator.of(context, 
                        rootNavigator: useRootNavigator)
                      .pop(item.value ?? index);
                    },
                  ),
                ));
              }).values.toList())
            ],
          ),
        );
      }
    );
  } 

}