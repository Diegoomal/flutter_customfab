import 'package:flutter/material.dart';

import 'customfabitems/add.dart';
import 'customfabitems/image.dart';
import 'customfabitems/inbox.dart';

class CustomFab extends StatefulWidget {
  @override
  _CustomFabState createState() => _CustomFabState();
}

class _CustomFabState extends State<CustomFab>
    with SingleTickerProviderStateMixin {

  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _animateColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  initState() {

    _animationController =
      AnimationController(
        vsync: this, 
        duration: Duration(milliseconds: 500)
      )
      ..addListener(() { 
        setState(() {}); 
      });

    _animateIcon =
      Tween<double>(begin: 0.0, end: 1.0)
      .animate(_animationController);

    _animateColor = 
      ColorTween(
        begin: Colors.blue, 
        end: Colors.red
      )
      .animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(0.00, 1.00, curve: _curve)
        )
      );

    _translateButton = 
      Tween<double>(
        begin: _fabHeight,
        end: -14.0,
      )
      .animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(0.0, 0.75, curve: _curve),
        )
      );

    super.initState();

  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  // Widget add() {
  //   return new Container(
  //     child: FloatingActionButton(
  //       onPressed: null,
  //       tooltip: 'Add',
  //       child: Icon(Icons.add),
  //     ),
  //   );
  // }

  // Widget image() {
  //   return new Container(
  //     child: FloatingActionButton(
  //       onPressed: null,
  //       tooltip: 'Image',
  //       child: Icon(Icons.image),
  //     ),
  //   );
  // }

  // Widget inbox() {
  //   return new Container(
  //     child: FloatingActionButton(
  //       onPressed: null,
  //       tooltip: 'Inbox',
  //       child: Icon(Icons.inbox),
  //     ),
  //   );
  // }

  Widget baseButtonToggle() {
    return FloatingActionButton(
      backgroundColor: _animateColor.value,
      onPressed: animate,
      tooltip: 'Toggle',
      child: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: _animateIcon,
      ),
    );
  }

  // Show only toggle button
  // @override
  // Widget build(BuildContext context) {
  //   return toggle();
  // }

  // Show all buttons
  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.end,
  //     children: <Widget>[
  //       add(),
  //       image(),
  //       inbox(),
  //       toggle(),
  //     ],
  //   );
  // }

  // Hide or Show by toggle
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(0.0, _translateButton.value * 3.0, 0.0),
          // child: add(),
          child: new CustomFabItemAdd(),
        ),
        Transform(
          transform: Matrix4.translationValues(0.0, _translateButton.value * 2.0, 0.0),
          // child: image(),
          child: new CustomFabItemImage(),
        ),
        Transform(
          transform: Matrix4.translationValues(0.0, _translateButton.value, 0.0),
          // child: inbox(),
          child: new CustomFabItemInbox(),
        ),
        baseButtonToggle(),
      ],
    );
  }

}