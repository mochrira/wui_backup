import 'dart:async';

import 'package:flutter/material.dart';

class WuiLoadingDialog {

  static WuiLoadingDialog _instance = WuiLoadingDialog._internal();
  WuiLoadingDialog._internal();
  factory WuiLoadingDialog() {
    return _instance;
  }

  static BuildContext _context;
  static StreamController _messageStream;
  static bool _lock = false;

  static open({ @required BuildContext context, String message }) {
    _context = context;
    _messageStream = StreamController();
    _lock = true;

    showDialog(
      context: _context,
      barrierDismissible: false,
      useRootNavigator: true,
      child: WillPopScope(
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
                  Text(snapshot.data ?? '')
                ],
              ),
            )
          )
        ),
      )
    );

    _messageStream.add(message);
  }

  static StreamController getMessageStream() {
    return _messageStream;
  }

  static close() {
    _lock = false;
    _messageStream.close();
    Navigator.of(_context, rootNavigator: true).pop();
  }

}