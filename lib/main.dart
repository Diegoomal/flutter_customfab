import 'package:flutter/material.dart';
import 'package:flutter_customfab/pages/otherpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CustomFAB',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: OtherPage(title: 'Flutter - Custom Floating Action Button')
    );
  }
}

