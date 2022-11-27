import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Каталог"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: buildBody(),
    );
  }
}
final double wdth = 300;
final double hght = 50;
final double fs = 17;
Widget buildBody() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    
    children: [
      
      
      Row(
         mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: hght,
            width: wdth,
            child: ElevatedButton(
              onPressed: (() {}),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 252, 255, 220),
              ),
              child: Text(
                "Популярное",
                style: TextStyle(
                  fontSize: fs,
                  color: Colors.black,
                  
                ),
              ),
            ),
          ),
        ],
      ),
      Row(
         mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: hght,
            width: wdth,
            child: ElevatedButton(
              onPressed: (() {}),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 252, 255, 220),
              ),
              child: Text(
                "Художественная литература",
                style: TextStyle(
                  fontSize: fs,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      Row(
         mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: hght,
            width: wdth,
            child: ElevatedButton(
              onPressed: (() {}),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 252, 255, 220),
              ),
              child: Text(
                "Нехудожественная литература",
                style: TextStyle(
                  fontSize: fs,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      Row(
         mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: hght,
            width: wdth,
            child: ElevatedButton(
              onPressed: (() {}),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 252, 255, 220),
              ),
              child: Text(
                "Книги на иностранных языках",
                style: TextStyle(
                  fontSize: fs,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: hght,
            width: wdth,
            child: ElevatedButton(
              onPressed: (() {}),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 252, 255, 220),
              ),
              child: Text(
                "Комиксы, Манга, Артбуки",
                style: TextStyle(
                  fontSize: fs,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: hght,
            width: wdth,
            child: ElevatedButton(
              onPressed: (() {}),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 252, 255, 220),
              ),
              child: Text(
                "Другое",
                style: TextStyle(
                  fontSize: fs,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: hght,
            width: wdth,
            child: ElevatedButton(
              onPressed: (() {}),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 252, 255, 220),
              ),
              child: Text(
                "Все книги",
                style: TextStyle(
                  fontSize: fs,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
