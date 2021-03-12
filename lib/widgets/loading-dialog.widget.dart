import 'dart:async';

import 'package:flutter/material.dart';

class WuiLoadingDialog {

  static WuiLoadingDialog _instance = WuiLoadingDialog._internal();
  WuiLoadingDialog._internal();
  factory WuiLoadingDialog() {
    return _instance;
  }
  static StreamController _messageStream = StreamController();
  static bool _lock = false;
  static late BuildContext _context;

  static open(BuildContext context, { String? message }) {
    _context = context;
    _lock = true;

    showDialog(
      context: _context,
      barrierDismissible: false,
      useRootNavigator: true,
      builder: (context) => WillPopScope(
        onWillPop: () async {
          return !_lock;
        },
        child: Dialog(
          child: StreamBuilder(
            stream: _messageStream.stream,
            builder: (context, snapshot) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Center(child: CircularProgressIndicator()),
                  SizedBox(height: 16),
                  Text(snapshot.data?.toString() ?? '')
                ],
              ),
            )
          )
        ),
      )
    );

    _messageStream.add(message);
  }

  static StreamController? getMessageStream() {
    return _messageStream;
  }

  static close() {
    _lock = false;
    _messageStream.close();
    Navigator.of(_context, rootNavigator: true).pop();
  }

}