import 'package:book_recomended/pages/card_page.dart';
import 'package:book_recomended/pages/catalog_page.dart';
import 'package:book_recomended/pages/people_page.dart';
import 'package:book_recomended/pages/profile_page.dart';
import 'package:book_recomended/pages/setting_page.dart';
import 'package:book_recomended/pages/statistic_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Footer extends StatefulWidget {
  
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}
final pages = [
  CardPage(),
  CatalogPage(),
  StatisticPage(),
  PeoplePage(),
  ProfilePage(),
  SettingPage(),
];
class _FooterState extends State<Footer> {


  int index = 4;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        height: 60,
        backgroundColor: Color(0xFFC7DAFF),
        selectedIndex: index,
        onDestinationSelected: ((index) => setState(() {this.index = index;})),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.menu_book),
            label: "",
          ),
          NavigationDestination(
            icon: Icon(Icons.library_books),
            label: "",
          ),
          NavigationDestination(
            icon: Icon(Icons.list),
            label: "",
          ),
          NavigationDestination(
            icon: Icon(Icons.people),
            label: "",
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: "",
          ),
        ],
      ),
    );
  }
}
