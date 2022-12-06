import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // title: Text("Статистика"),
        // centerTitle: true,
        backgroundColor: Color.fromRGBO(70, 155, 150, 1),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/image/BackMain.jpg"),
          fit: BoxFit.fill,
        )),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
              child: Container(
                height: 145,
                width: 290,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(195, 175, 152, 1),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                      blurRadius: 1.0,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Text(
                        "Нравится",
                        style: TextStyle(fontSize: 24, fontFamily: "OpenSans"),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                                height: 29,
                                width: 57.25,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(248, 217, 217, 1),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(3)),
                                ),
                                child: Align(
                                  child: Text(
                                    "Фэнтэзи",
                                    style: TextStyle(
                                        fontSize: 12, fontFamily: "OpenSans"),
                                  ),
                                )),
                            Text("150"),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                                height: 29,
                                width: 57.25,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(244, 244, 201, 1),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(3)),
                                ),
                                child: Align(
                                  child: Text(
                                    "Романы",
                                    style: TextStyle(
                                        fontSize: 12, fontFamily: "OpenSans"),
                                  ),
                                )),
                            Text("150"),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                                height: 29,
                                width: 57.25,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(179, 255, 200, 1),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(3)),
                                ),
                                child: Align(
                                  child: Text(
                                    "Приключения",
                                    style: TextStyle(
                                        fontSize: 12, fontFamily: "OpenSans"),
                                  ),
                                )),
                            Text("150"),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                                height: 29,
                                width: 57.25,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(169, 243, 253, 1),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(3)),
                                ),
                                child: Align(
                                  child: Text(
                                    "Классика",
                                    style: TextStyle(
                                        fontSize: 12, fontFamily: "OpenSans"),
                                  ),
                                )),
                            Text("150"),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 66.25,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(248, 217, 217, 1),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 66.25,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(243, 244, 201, 1),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 66.25,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(179, 255, 200, 1),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 66.25,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(169, 243, 253, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
              child: Container(
                height: 145,
                width: 290,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(195, 175, 152, 1),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                      blurRadius: 1.0,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Text(
                        "Не нравится",
                        style: TextStyle(fontSize: 24, fontFamily: "OpenSans"),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                                height: 29,
                                width: 57.25,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(248, 217, 217, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3)),
                                ),
                                child: Align(
                                  child: Text(
                                    "Фэнтэзи",
                                    style: TextStyle(
                                        fontSize: 12, fontFamily: "OpenSans"),
                                  ),
                                )),
                            Text("150"),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                                height: 29,
                                width: 57.25,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(244, 244, 201, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3)),
                                ),
                                child: Align(
                                  child: Text(
                                    "Романы",
                                    style: TextStyle(
                                        fontSize: 12, fontFamily: "OpenSans"),
                                  ),
                                )),
                            Text("150"),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                                height: 29,
                                width: 57.25,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(179, 255, 200, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3)),
                                ),
                                child: Align(
                                  child: Text(
                                    "Приключения",
                                    style: TextStyle(
                                        fontSize: 12, fontFamily: "OpenSans"),
                                  ),
                                )),
                            Text("150"),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                                height: 29,
                                width: 57.25,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(169, 243, 253, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3)),
                                ),
                                child: Align(
                                  child: Text(
                                    "Классика",
                                    style: TextStyle(
                                        fontSize: 12, fontFamily: "OpenSans"),
                                  ),
                                )),
                            Text("150"),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 66.25,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(248, 217, 217, 1),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 66.25,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(243, 244, 201, 1),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 66.25,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(179, 255, 200, 1),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 66.25,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(169, 243, 253, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
