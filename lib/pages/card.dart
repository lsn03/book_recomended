import 'dart:js';

import 'package:book_recomended/pages/card_provider.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:swipable_stack/swipable_stack.dart';

class TinderCard extends StatefulWidget {
  const TinderCard({super.key});

  @override
  State<TinderCard> createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child:
  }
}

//Widget buildFrontCard()=>

Widget buildCard() => 
   Container(
    decoration: BoxDecoration(
      color: Color(0xFFFFFDD3),
      borderRadius: BorderRadius.all(Radius.circular(50)),
    ),
    margin: EdgeInsets.all(40),
    width: 400,
    height: 550,
    padding: EdgeInsets.all(20),
  );

