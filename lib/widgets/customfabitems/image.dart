import 'package:flutter/material.dart';

class CustomFabItemImage extends StatefulWidget {
  @override
  _CustomFabItemImageState createState() => _CustomFabItemImageState();
}

class _CustomFabItemImageState extends State<CustomFabItemImage> {

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: FloatingActionButton(
        tooltip: 'Image',
        child: Icon(Icons.image),
        onPressed: _execute
      ),
    );
  }
  
  void _execute() {
    setState(() {

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Event Alert"),
            content: new Text("Custom Float Action Button Item Image Clicked!"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("OK"),
                onPressed: () { Navigator.of(context).pop(); },
              ),
            ]
          );
        },
      );
      
    });
  }

}