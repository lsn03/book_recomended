import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Love&Read"),
        centerTitle: true,
      ),
      body: Card(),
    );
  }
}

class Card extends StatefulWidget {
  const Card({super.key});

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  int sens = 8;
  bool right = false, left = false;
  bool up = false, down = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx > sens) {
          // right swipe
          print("right!!!!!\t!!");
          setState(() {
            right = true;
            left = false;
          });
        } else if (details.delta.dx < -sens) {
          // left swipe;
          print("left \t\t\t flflfll");
          setState(() {
            right = false;
            left = true;
          });
        }
      },
      onVerticalDragUpdate: ((details) {
        if (details.delta.dy > sens) {
          // Down Swipe
          print("down\t\t\t down");
          setState(() {
            down = true;
            up = false;
          });
        } else if (details.delta.dy < -sens) {
          // Up Swipe
          print("up \t\t\tup");

          setState(() {
            down = false;
            up = true;
          });
        }
      }),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
          child: Center(
              child: Image(
        image: AssetImage("assets/image/card.jpg"),
      ))),
      /*
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFDD3),
        ),
        margin: EdgeInsets.all(40),
        alignment: Alignment.center,
        width: 400,
        height: 550,
        padding: EdgeInsets.all(20),
        child: GestureDetector(
          child: Row(),
        ),
      ),*/
    );
  }
}
