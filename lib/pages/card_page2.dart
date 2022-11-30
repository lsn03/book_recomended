import 'package:flutter/material.dart';

import 'package:book_recomended/Others/swipe_interface.dart';

void main() => runApp(const SwipeInterfaceApp());

class SwipeInterfaceApp extends StatelessWidget {
  const SwipeInterfaceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        color: Colors.transparent,
        child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppBar(),
              SwipeInterface(),
            ],
          ),
        ),
      ),
    );
  }
}