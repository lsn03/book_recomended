import 'dart:convert';
import 'dart:developer';

import 'package:book_recomended/Others/book.dart';
import 'package:book_recomended/Others/swipe_card.dart';
import 'package:book_recomended/Others/swipe_card_2.dart';
import 'package:book_recomended/backend/mysql.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SwipeInterface extends StatefulWidget {
  const SwipeInterface({super.key});

  @override
  State<StatefulWidget> createState() => _SwipeInterfaceState();
}

class _SwipeInterfaceState extends State<SwipeInterface> {
  List<Profile> profiles = <Profile>[
    Profile(
        id_book: "1",
        author_book: "Placeholder 1",
        book_name: "Placeholder 1",
        year: "99",
        genre_book: 'Placeholder 1 user description',
        age_permission: "99",
        annotation_book: 'Placeholder 1 user description',
        book_image: 'https://staticlb.rmr.rocks/uploads/pics/01/52/470_o.jpg'),
    Profile(
        id_book: "2",
        author_book: "Placeholder 2",
        book_name: "Placeholder 2",
        year: "99",
        genre_book: 'Placeholder 2 user description',
        age_permission: "99",
        annotation_book: 'Placeholder 2 user description',
        book_image: 'https://staticlb.rmr.rocks/uploads/pics/01/52/470_o.jpg'),
  ];

  int stackCounter = 0;
  int end = 9;

  int cntNrav = 0;
  int cntNeNrav = 0;
  int cntWannaRead = 0;
  int skipcount = 0;

  double swipeThresholdx = 100.0;
  double swipeThresholdy = 150.0;

  int cnt_of_like_book = -1;
  int cnt_of_dislike_book = -1;
  int cnt_of_wishes_book = -1;

  loadJsonData() async {
    String apiurl = Mysql.loadBooks;
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("userEmail")) {
      var response = await http.post(
        Uri.parse(apiurl),
        body: {
          'email': prefs.getString("userEmail"),
          'cnt': (end + 2).toString(),
        },
      );

      String jsonData = response.body;
      

      setState(() {
        profiles = json
            .decode(jsonData)
            .map<Profile>((dataPoint) => Profile.fromJson(dataPoint))
            .toList();
      });
      FetchData();
    }

    //String jsonData = await rootBundle.loadString('assets/json/books.json');
  }

  FetchData() async {
    String apiurl = Mysql.fetchData;
    final prefs = await SharedPreferences.getInstance();
    var response = await http.post(
      Uri.parse(apiurl),
      body: {
        'email': prefs.getString("userEmail"),
        'fetchData': "true",
      },
    );
    Map<String, dynamic> res = jsonDecode(response.body);

    cnt_of_wishes_book = int.parse(res["cnt_of_wishes_book"]);
    cnt_of_like_book = int.parse(res["cnt_of_like_book"]);
    cnt_of_dislike_book = int.parse(res["cnt_of_dislike_book"]);

    prefs.setInt("cnt_of_wishes_book", cnt_of_wishes_book);
    prefs.setInt("cnt_of_like_book", cnt_of_like_book);
    prefs.setInt("cnt_of_dislike_book", cnt_of_dislike_book);
  }
  UpdateData(int number) async{
    String apiurl = Mysql.updateData;
    final prefs = await SharedPreferences.getInstance();
    cnt_of_wishes_book += number==3?1:0;
    cnt_of_like_book += number==1?1:0;
    cnt_of_dislike_book += number==2?1:0;
    var response = await http.post(
      Uri.parse(apiurl),
      body: {
        'email': prefs.getString("userEmail"),
        'updateData': "true",
        'cnt_of_wishes_book': "$cnt_of_wishes_book",
        'cnt_of_like_book': "$cnt_of_like_book",
        'cnt_of_dislike_book': "$cnt_of_dislike_book",
      },
    );
    Map<String, dynamic> res = jsonDecode(response.body);

       

    prefs.setInt("cnt_of_wishes_book", cnt_of_wishes_book);
    prefs.setInt("cnt_of_like_book", cnt_of_like_book);
    prefs.setInt("cnt_of_dislike_book", cnt_of_dislike_book);
  }
  _SwipeInterfaceState() {
    loadJsonData();
  }

  void evaluateSwipe(dx, dy) {
    if (dx > swipeThresholdx) {
      likeBook();
      log("like");
    }
    if (dx < -swipeThresholdx) {
      doNotLikeBook();
      log("dislike");
    }
    if (dy < -swipeThresholdy) {
      WantReadBook();
      log("wannaread");
    }
    if (dy > swipeThresholdy) {
      SkipBook();
      log("skip");
    }
  }

  void likeBook() {
    // do some magic
    if (stackCounter == end) {
      print("the end of list!");
    } else {
      increaseStackCounter();
      cntNrav++;
      UpdateData(1);
    }
    print(cntNrav);
    print("l");
  }

  void doNotLikeBook() {
    // do some other magic
    if (stackCounter == end) {
      print("the end of list!");
    } else {
      increaseStackCounter();
      cntNeNrav++;
      UpdateData(2);
    }
    print(cntNeNrav);
    print("d");
  }

  void WantReadBook() {
    if (stackCounter == end) {
      print("the end of list!");
    } else {
      increaseStackCounter();
      cntWannaRead++;
      UpdateData(3);
    }
    print(cntWannaRead);
    print("w");
  }

  void SkipBook() {
    if (stackCounter == end) {
      print("the end of list!");
    } else {
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
          onDragEnd: (details) =>
              evaluateSwipe(details.offset.dx, details.offset.dy),
          feedback: SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: FlipCard(
              fill: Fill.fillBack,
              direction: FlipDirection.VERTICAL,
              front: SwipeCard(
                id_book: profiles[stackCounter].id_book,
                author_book: profiles[stackCounter].author_book,
                book_name: profiles[stackCounter].book_name,
                year: profiles[stackCounter].year,
                genre_book: profiles[stackCounter].genre_book,
                age_permission: profiles[stackCounter].age_permission,
                annotation_book: profiles[stackCounter].annotation_book,
                book_image: profiles[stackCounter].book_image,
              ),
              back: SwipeCard2(
                id_book: profiles[stackCounter].id_book,
                author_book: profiles[stackCounter].author_book,
                book_name: profiles[stackCounter].book_name,
                year: profiles[stackCounter].year,
                genre_book: profiles[stackCounter].genre_book,
                age_permission: profiles[stackCounter].age_permission,
                annotation_book: profiles[stackCounter].annotation_book,
                book_image: profiles[stackCounter].book_image,
              ),
            ),
          ),
          childWhenDragging: SwipeCard(
            id_book: profiles[stackCounter + 1].id_book,
            author_book: profiles[stackCounter + 1].author_book,
            book_name: profiles[stackCounter + 1].book_name,
            year: profiles[stackCounter + 1].year,
            genre_book: profiles[stackCounter + 1].genre_book,
            age_permission: profiles[stackCounter + 1].age_permission,
            annotation_book: profiles[stackCounter + 1].annotation_book,
            book_image: profiles[stackCounter + 1].book_image,
          ),
          child: FlipCard(
            fill: Fill.fillBack,
            direction: FlipDirection.HORIZONTAL,
            front: SwipeCard(
              id_book: profiles[stackCounter].id_book,
              author_book: profiles[stackCounter].author_book,
              book_name: profiles[stackCounter].book_name,
              year: profiles[stackCounter].year,
              genre_book: profiles[stackCounter].genre_book,
              age_permission: profiles[stackCounter].age_permission,
              annotation_book: profiles[stackCounter].annotation_book,
              book_image: profiles[stackCounter].book_image,
            ),
            back: SwipeCard2(
              id_book: profiles[stackCounter].id_book,
              author_book: profiles[stackCounter].author_book,
              book_name: profiles[stackCounter].book_name,
              year: profiles[stackCounter].year,
              genre_book: profiles[stackCounter].genre_book,
              age_permission: profiles[stackCounter].age_permission,
              annotation_book: profiles[stackCounter].annotation_book,
              book_image: profiles[stackCounter].book_image,
            ),
          ),
        ),
      ),
    );
  }
}
