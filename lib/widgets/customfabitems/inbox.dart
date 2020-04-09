import 'package:flutter/material.dart';

class CustomFabItemInbox extends StatefulWidget {
  @override
  _CustomFabItemInboxState createState() => _CustomFabItemInboxState();
}

class _CustomFabItemInboxState extends State<CustomFabItemInbox> {

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: FloatingActionButton(
        tooltip: 'Inbox',
        child: Icon(Icons.inbox),
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
            content: new Text("Custom Float Action Button Item Inbox Clicked!"),
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