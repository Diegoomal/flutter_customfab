import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_customfab/widgets/customfab.dart';


class OtherPage extends StatefulWidget {

  OtherPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _OtherPageState createState() => _OtherPageState();

}

class _OtherPageState extends State<OtherPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: CustomFab()      
    );
  }
  
}
