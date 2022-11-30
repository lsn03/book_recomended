import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'book.dart';
import 'swipe_card.dart';

class SwipeInterface extends StatefulWidget {
  const SwipeInterface({super.key});

  @override
  State<StatefulWidget> createState() => _SwipeInterfaceState();
}

class _SwipeInterfaceState extends State<SwipeInterface> {
  List<Profile> profiles = <Profile>[
    Profile(
        id: "222",
        userName: "Placeholder 1",
        userAge: 99,
        userDescription: "Placeholder 1 user description",
        profileImageSrc: 'assets/bookspreview/WaP.jpg'),
    Profile(
        id: "333",
        userName: "Placeholder 2",
        userAge: 99,
        userDescription: "Placeholder 2 user description",
        profileImageSrc: 'assets/bookspreview/WaP.jpg'),
  ];

  int stackCounter = 0;
  int end = 5;
  int likecount = 0;
  int dislikecount = 0;
  int wantcount = 0;
  int skipcount = 0;
  double swipeThresholdx = 100.0;
  double swipeThresholdy = 150.0;

  loadJsonData() async {
    String jsonData = await rootBundle.loadString('assets/json/books.json');
    setState(() {
      profiles = json
          .decode(jsonData)
          .map<Profile>((dataPoint) => Profile.fromJson(dataPoint))
          .toList();
    });
  }

  _SwipeInterfaceState() {
    loadJsonData();
  }

  void evaluateSwipe(dx, dy) {
    if (dx > swipeThresholdx) {
      likeBook();
    }
    if (dx < -swipeThresholdx) {
      doNotLikeBook();
    }
    if (dy < -swipeThresholdy){
      WantReadBook();
    }
    if (dy > swipeThresholdy){
      SkipBook();
    }
  }

  void likeBook() {
    // do some magic
    if (stackCounter == end){
      print("the end of list!");
    }else {
      increaseStackCounter();
      likecount++;
    }
    print(likecount);
    print("l");
  }

  void doNotLikeBook() {
    // do some other magic
    if (stackCounter == end){
      print("the end of list!");
    }else {
      increaseStackCounter();
      dislikecount++;
    }
    print(dislikecount);
    print("d");
  }

  void WantReadBook(){
    if (stackCounter == end){
      print("the end of list!");
    }else {
      increaseStackCounter();
      wantcount++;
    }
    print(wantcount);
    print("w");
  }

  void SkipBook(){
    if (stackCounter == end){
      print("the end of list!");
    }else {
      increaseStackCounter();
      skipcount++;
    }
    print(skipcount);
    print("s");
  }

  void increaseStackCounter() {
    setState(() {
      stackCounter++;
    });
  }

  // void CheckEnd(a) {
  //   if (a == end) {
  //     stackCounter--;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) => Draggable(
          onDragEnd: (details) => evaluateSwipe(details.offset.dx, details.offset.dy),
          feedback: SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: SwipeCard(
              id: profiles[stackCounter].id,
              userName: profiles[stackCounter].userName,
              userAge: profiles[stackCounter].userAge,
              userDescription: profiles[stackCounter].userDescription,
              profileImageSrc: profiles[stackCounter].profileImageSrc,
            ),
          ),
          childWhenDragging: SwipeCard(
            id: profiles[stackCounter + 1].id,
            userName: profiles[stackCounter + 1].userName,
            userAge: profiles[stackCounter + 1].userAge,
            userDescription: profiles[stackCounter + 1].userDescription,
            profileImageSrc: profiles[stackCounter + 1].profileImageSrc,
          ),
          child: SwipeCard(
            id: profiles[stackCounter].id,
            userName: profiles[stackCounter].userName,
            userAge: profiles[stackCounter].userAge,
            userDescription: profiles[stackCounter].userDescription,
            profileImageSrc: profiles[stackCounter].profileImageSrc,
          ),
        ),
      ),
    );
  }
}
