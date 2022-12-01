import 'package:flutter/material.dart';

class SwipeCard2 extends StatelessWidget {
  final String id_book;
  final String author_book;
  final String book_name;
  final int year;
  final String genre_book;
  final int age_permission;
  final String annotation_book;
  final String book_image;

  const SwipeCard2({
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
      alignment: Alignment.center,
      child: ListView(children: [
        Padding(
          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: Container(
            height: 548,
            width: 20,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(46)),
                color: Color.fromRGBO(70, 155, 150, 1)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 40, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$book_name",
                        style: TextStyle(
                          fontSize: 24,
                          color: Color.fromRGBO(242, 241, 229, 1),
                          fontFamily: "OpenSans",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Icon(
                          Icons.send,
                          size: 30,
                          color: Color.fromRGBO(242, 241, 229, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Container(
                    height: 210,
                    width: 302,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(235, 226, 215, 1),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.2),
                          blurRadius: 2.0,
                          offset: Offset(0, 5),
                        )
                      ],
                    ),
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Align(
                          child: Text(
                            "Аннотация",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "OpenSans",
                            ),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Align(
                          child: SingleChildScrollView(
                            child: Container(
                              height: 150,
                              child: Text(
                              "$annotation_book",
                              style: TextStyle(fontSize: 13),
                              overflow: TextOverflow.clip,
                            ),
                          ),),
                          alignment: Alignment.center,
                        ),
                      ),
                    ]),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(195, 175, 152, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.2),
                                  blurRadius: 2.0,
                                  offset: Offset(0, 5),
                                )
                              ],
                            ),
                            height: 20,
                            // width: 85,
                            child: Align(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                child: Text(
                                  "Фэнтэзи",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "OpenSans",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(195, 175, 152, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.2),
                                  blurRadius: 2.0,
                                  offset: Offset(0, 5),
                                )
                              ],
                            ),
                            height: 20,
                            // width: 85,
                            child: Align(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                child: Text(
                                  "Романы",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "OpenSans",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(195, 175, 152, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.2),
                                  blurRadius: 2.0,
                                  offset: Offset(0, 5),
                                )
                              ],
                            ),
                            height: 20,
                            // width: 85,
                            child: Align(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                child: Text(
                                  "Классика",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "OpenSans",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 20, 15, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(195, 175, 152, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.2),
                                  blurRadius: 2.0,
                                  offset: Offset(0, 5),
                                )
                              ],
                            ),
                            height: 20,
                            // width: 85,
                            child: Align(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                child: Text(
                                  "Приключения",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "OpenSans",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        // Padding(
        //   padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
        //   child: Container(
        //     height: 108,
        //     width: 20,
        //     decoration: BoxDecoration(
        //       color: Color.fromRGBO(70, 155, 150, 1),
        //       borderRadius: BorderRadius.only(
        //         bottomLeft: Radius.circular(46),
        //         bottomRight: Radius.circular(46),
        //       ),
        //     ),
        //     child: Column(
        //       mainAxisSize: MainAxisSize.max,
        //       mainAxisAlignment: MainAxisAlignment.end,
        //       children: [
        //         Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
        //             child:Align(child: Text(
        //                 "$book_name",
        //                 overflow: TextOverflow.fade,
        //                 style: const TextStyle(
        //                     color: Colors.white,
        //                     fontSize: 24,
        //                     fontWeight: FontWeight.bold),
        //               ),),
        //           ),
        //         Padding(
        //           padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
        //           child: Align(child: Text(
        //             "$age_permission+",
        //             style: const TextStyle(
        //               color: Colors.white,
        //               fontSize: 16,
        //               fontWeight: FontWeight.w500,
        //               fontStyle: FontStyle.normal,
        //             ),
        //           ),),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ]),
    );
  }
}
