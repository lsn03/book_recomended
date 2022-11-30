import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:book_recomended/pages/pages.dart';
import 'package:book_recomended/pages/into_catalog_page.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Каталог",
          style: TextStyle(color: Color.fromRGBO(242, 241, 229, 1)),
        ),
        centerTitle: true,
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
    decoration: BoxDecoration(color: Color.fromRGBO(242, 241, 229, 1)),
    child: Align(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: SizedBox(
              width: wdth,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(195, 175, 152, 1),
                ),
                onPressed: (() {

                }),
                child: Text("Популярное", style: TextStyle(
                  fontSize: 19,
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: SizedBox(
              width: wdth,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(195, 175, 152, 1),
                ),
                onPressed: () {},
                child: Text("Художественная литература", style: TextStyle(
                  fontSize: 19,
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: SizedBox(
              width: wdth,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(195, 175, 152, 1),
                ),
                onPressed: () {},
                child: Text("Нехудожественная литература", style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: SizedBox(
              width: wdth,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(195, 175, 152, 1),
                ),
                onPressed: () {},
                child: Text("Комиксы, Манга, Артбуки", style: TextStyle(
                  fontSize: 19,
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: SizedBox(
              width: wdth,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(195, 175, 152, 1),
                ),
                onPressed: () {},
                child: Text("Все книги", style: TextStyle(
                  fontSize: 19,
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
