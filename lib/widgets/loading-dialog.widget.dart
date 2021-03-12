import 'package:flutter/material.dart';

class WuiLoadingDialog {

  static bool _lock = false;
  static late BuildContext _context;

  static open(BuildContext context, { String? message }) {
    _context = context;
    _lock = true;

    showDialog(
      context: _context,
      barrierDismissible: false,
      useRootNavigator: true,
      barrierColor: Colors.black.withOpacity(.35),
      builder: (context) => WillPopScope(
        onWillPop: () async {
          return !_lock;
        },
        child: Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(48),
                  color: Colors.white
                ),
                child: CircularProgressIndicator(),
              )
            ],
          )
        ),
      )
    );
  }

  static close() {
    _lock = false;
    Navigator.of(_context, rootNavigator: true).pop();
  }

}