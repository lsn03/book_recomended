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
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/BackMain.jpg"),
              fit: BoxFit.fill,
            )
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(height: 50, color: Color.fromRGBO(70, 155, 150, 1),),
              SwipeInterface(),
            ],
          ),
        ),
      ),
    );
  }
}