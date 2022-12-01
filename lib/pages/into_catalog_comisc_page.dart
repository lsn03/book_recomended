import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:book_recomended/Others/book.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'dart:core';
import 'package:flutter/src/painting/box_shadow.dart';

class IntoCatalogComicsPage extends StatefulWidget {
  const IntoCatalogComicsPage({super.key});

  @override
  State<StatefulWidget> createState() => _IntoCatalogComicsfacePage();
}

class _IntoCatalogComicsfacePage extends State<IntoCatalogComicsPage> {
  // List<Profile> profiles = <Profile>[
  //   Profile(
  //       id: "222",
  //       userName: "Placeholder 1",
  //       userAge: 99,
  //       userDescription: "Placeholder 1 user description",
  //       profileImageSrc: 'assets/bookspreview/WaP.jpg'),
  //   Profile(
  //       id: "333",
  //       userName: "Placeholder 2",
  //       userAge: 99,
  //       userDescription: "Placeholder 2 user description",
  //       profileImageSrc: 'assets/bookspreview/WaP.jpg'),
  // ];

  // loadJsonData() async {
  //   String jsonData = await rootBundle.loadString('assets/json/books.json');
  //   setState(() {
  //     profiles = json
  //         .decode(jsonData)
  //         .map<Profile>((dataPoint) => Profile.fromJson(dataPoint))
  //         .toList();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(70, 155, 150, 1),
      ),
      body: buildBody(),
    );
  }
}

final double wdth = 300;
final double hght = 50;
final double fs = 17;

Widget buildBody() {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
      image: AssetImage("assets/image/BackMain.jpg"),
      fit: BoxFit.fill,
    )),
    child: SingleChildScrollView(
      child: Align(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
              child: Text(
                "Комиксы, Манга, Артбуки",
                style: TextStyle(fontSize: 32,
                  fontFamily: "OpenSans",),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 160,
                    width: 105,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(70, 155, 150, 1),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: ListView(
                      children: [
                        Container(
                          height: 120,
                          width: 105,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage("figma/ComicsAndManga/BlackTorch.jpg"),
                                fit: BoxFit.fill,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                        ),
                        Container(
                          height: 40,
                          width: 105,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(70, 155, 150, 1),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.3),
                                blurRadius: 1.0,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Align(
                            child: Text(
                              "Чёрный факел",
                              style: TextStyle(
                                  color: Color.fromRGBO(242, 241, 229, 1),
                                fontFamily: "OpenSans",),
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 160,
                    width: 105,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(70, 155, 150, 1),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: ListView(
                      children: [
                        Container(
                          height: 120,
                          width: 105,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                AssetImage("figma/ComicsAndManga/Bleach.jpg"),
                                fit: BoxFit.fill,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                        ),
                        Container(
                          height: 40,
                          width: 105,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(70, 155, 150, 1),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.3),
                                blurRadius: 1.0,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Align(
                            child: Text(
                              "Блич",
                              style: TextStyle(
                                  color: Color.fromRGBO(242, 241, 229, 1),
                                fontFamily: "OpenSans",),
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 160,
                    width: 105,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(70, 155, 150, 1),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: ListView(
                      children: [
                        Container(
                          height: 120,
                          width: 105,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                AssetImage("figma/ComicsAndManga/KillerClass.jpg"),
                                fit: BoxFit.fill,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                        ),
                        Container(
                          height: 40,
                          width: 105,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(70, 155, 150, 1),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.3),
                                blurRadius: 1.0,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Align(
                            child: Text(
                              "Класс убийц",
                              style: TextStyle(
                                  color: Color.fromRGBO(242, 241, 229, 1),
                                fontFamily: "OpenSans",),
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 160,
                    width: 105,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(70, 155, 150, 1),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: ListView(
                      children: [
                        Container(
                          height: 120,
                          width: 105,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                AssetImage("figma/ComicsAndManga/PoluChelovek.jpg"),
                                fit: BoxFit.fill,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                        ),
                        Container(
                          height: 40,
                          width: 105,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(70, 155, 150, 1),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.3),
                                blurRadius: 1.0,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Align(
                            child: Text(
                              "Получеловек",
                              style: TextStyle(
                                  color: Color.fromRGBO(242, 241, 229, 1),
                                fontFamily: "OpenSans",),
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 160,
                    width: 105,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(70, 155, 150, 1),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: ListView(
                      children: [
                        Container(
                          height: 120,
                          width: 105,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                AssetImage("figma/ComicsAndManga/PustoCvet.jpg"),
                                fit: BoxFit.fill,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                        ),
                        Container(
                          height: 40,
                          width: 105,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(70, 155, 150, 1),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.3),
                                blurRadius: 1.0,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Align(
                            child: Text(
                              "Пустоцвет",
                              style: TextStyle(
                                  color: Color.fromRGBO(242, 241, 229, 1),
                                fontFamily: "OpenSans",),
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 160,
                    width: 105,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(70, 155, 150, 1),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: ListView(
                      children: [
                        Container(
                          height: 120,
                          width: 105,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                AssetImage("figma/ComicsAndManga/SecretLove.jpg"),
                                fit: BoxFit.fill,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                        ),
                        Container(
                          height: 40,
                          width: 105,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(70, 155, 150, 1),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.3),
                                blurRadius: 1.0,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Align(
                            child: Text(
                              "Тайная любовь",
                              style: TextStyle(
                                  color: Color.fromRGBO(242, 241, 229, 1),
                                fontFamily: "OpenSans",),
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
