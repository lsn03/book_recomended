import 'package:book_recomended/pages/card_page.dart';
import 'package:book_recomended/pages/catalog_page.dart';
import 'package:book_recomended/pages/into_catalog_popular_page.dart';
import 'package:book_recomended/pages/people_page.dart';
import 'package:book_recomended/pages/profile_page.dart';
import 'package:book_recomended/pages/setting_page.dart';
import 'package:book_recomended/pages/statistic_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:book_recomended/Others/CustomIcons.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

final pages = [
  SwipeInterfaceApp(),
  CatalogPage(),
  StatisticPage(),
  PeoplePage(),
  ProfilePage(),
];

class _FooterState extends State<Footer> {
  int index = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        height: 60,
        backgroundColor: Color.fromRGBO(70, 155, 150, 1),
        selectedIndex: index,
        onDestinationSelected: ((index) => setState(() {
              this.index = index;
            })),
        destinations: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: NavigationDestination(
              icon: Icon(
                CustomIcons.bookchoose,
                color: Color.fromRGBO(242, 241, 229, 1),
                size: 30,
              ),
              label: "",
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: NavigationDestination(
              icon: Icon(
                CustomIcons.list,
                color: Color.fromRGBO(242, 241, 229, 1),
                size: 30,
              ),
              label: "",
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: NavigationDestination(
              icon: Icon(
                CustomIcons.statistic,
                color: Color.fromRGBO(242, 241, 229, 1),
                size: 30,
              ),
              label: "",
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: NavigationDestination(
              icon: Icon(
                CustomIcons.communty,
                color: Color.fromRGBO(242, 241, 229, 1),
                size: 30,
              ),
              label: "",
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: NavigationDestination(
              icon: Icon(
                CustomIcons.person,
                color: Color.fromRGBO(242, 241, 229, 1),
                size: 30,
              ),
              label: "",
            ),
          ),
        ],
      ),
    );
  }
}
