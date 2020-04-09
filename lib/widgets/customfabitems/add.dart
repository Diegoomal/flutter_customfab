import 'package:flutter/material.dart';

class CustomFabItemAdd extends StatefulWidget {
  @override
  _CustomFabItemAddState createState() => _CustomFabItemAddState();
}

class _CustomFabItemAddState extends State<CustomFabItemAdd> {

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: FloatingActionButton(
        tooltip: 'Add',
        child: Icon(Icons.add),
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
            content: new Text("Custom Float Action Button Item Add Clicked!"),
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