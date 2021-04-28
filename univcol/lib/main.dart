import 'package:flutter/material.dart';
import 'package:univcol/src/pages/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UnivColApp',
      home: UptcPage(),
      theme: ThemeData(
        primaryColor: Colors.grey,
        accentColor: Colors.blueGrey,
      ),
    );
  }
}
