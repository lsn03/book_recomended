import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PeoplePage extends StatefulWidget {
  const PeoplePage({super.key});

  @override
  State<PeoplePage> createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Сообщество"),
        centerTitle: true,
      ),
      body: buildBody(),
    );
  }
}

Widget buildBody() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      peopleItem("Дарья", "87%"),
      peopleItem("Мария", "66%"),
      peopleItem("Александра", "54%"),
      peopleItem("Евгения", "50%"),
      peopleItem("Алена", "45%"),
      peopleItem("Екатерина", "42%"),
      peopleItem("Алиса", "42%"),
    ],
  );
}

Widget peopleItem(String name, String percent) {
  return Center(
    child: Container(
      alignment: Alignment.center,
      height: 50,
      width: 300,
      decoration: BoxDecoration(
        color: Color(0xFFD0FFD1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.fromLTRB(8,0,0,0),
              child: SizedBox(child: Text("$name",textAlign: TextAlign.left,),width: 100,),
            ),
            SizedBox(
              width: 100,
            ),
            Text("$percent"),
          ],
        ),
      ),
    ),
  );
}
