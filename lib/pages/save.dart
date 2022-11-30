import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:swipe_cards/swipe_cards.dart';

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
        backgroundColor: Color.fromRGBO(70, 155, 150, 1),
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/BackMain.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Align(
          child: Container(
            height: 480,
            width: 325,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(46),
            ),
            child: ListView(
              children: [                                       //1.117
                Container(
                  height: 372,
                  width: 20,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/image/WaP.jpg"),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(46),
                      topRight: Radius.circular(46),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                  ),
                ),
                Container(
                  height: 108,
                  width: 20,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(70, 155, 150, 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(46),
                      bottomRight: Radius.circular(46),
                    ),
                  ),
                  child: Align(child: Text("Война и мир", style: TextStyle(fontSize: 30, color: Color.fromRGBO(242, 241, 229, 1)),),),
                ),
              ],
            ),
          ),
        ),
      ),
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
