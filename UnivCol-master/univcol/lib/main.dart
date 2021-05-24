import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:univcol/src/pages/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.lightGreen,
        systemNavigationBarDividerColor: Colors.black,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UnivCol',
      home: UisPage(),
      theme: ThemeData(
        primaryColor: Colors.grey,
        accentColor: Colors.blueGrey,
      ),
    );
  }
}
