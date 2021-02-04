import 'package:bloc_pattern/first_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoc Demo',
      home: FirstPage(),
    );
  }
}
