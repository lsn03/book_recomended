import 'package:flutter/material.dart';

class SwipeCard extends StatelessWidget {
  final String id_book;
  final String author_book;
  final String book_name;
  final int year;
  final String genre_book;
  final int age_permission;
  final String annotation_book;
  final String book_image;

  const SwipeCard({
    Key? key,
    required this.id_book,
    required this.author_book,
    required this.book_name,
    required this.year,
    required this.genre_book,
    required this.age_permission,
    required this.annotation_book,
    required this.book_image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ListView(children: [
        Padding(
          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: Container(
            height: 440,
            width: 20,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(46),
                topRight: Radius.circular(46),
              ),
              image: DecorationImage(
                  image: AssetImage(book_image), fit: BoxFit.fill),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: Container(
            height: 108,
            width: 20,
            decoration: BoxDecoration(
              color: Color.fromRGBO(70, 155, 150, 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(46),
                bottomRight: Radius.circular(46),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child:Align(child: Text(
                        "$book_name",
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),),
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                  child: Align(child: Text(
                    "$age_permission+",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                  ),),
                ),
              ],
            ),
          ),
        ),
      ]),
      alignment: Alignment.center,
    );
  }
}
