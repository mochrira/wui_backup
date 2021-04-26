import 'package:flutter/material.dart';
import 'package:wui/wui.dart';

import 'home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: WuiTheme.light(context),
      home: HomePage(),
    );
  }
}
