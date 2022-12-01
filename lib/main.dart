import 'package:book_recomended/pages/authorization_form.dart';
import 'package:book_recomended/pages/card_page.dart';
import 'package:book_recomended/pages/catalog_page.dart';
import 'package:book_recomended/pages/into_catalog_allbooks_page.dart';
import 'package:book_recomended/pages/into_catalog_comisc_page.dart';
import 'package:book_recomended/pages/into_catalog_liter_page.dart';
import 'package:book_recomended/pages/into_catalog_notliter_page.dart';
import 'package:book_recomended/pages/people_page.dart';
import 'package:book_recomended/pages/profile_page.dart';
import 'package:book_recomended/pages/setting_page.dart';
import 'package:book_recomended/pages/statistic_page.dart';
import 'package:book_recomended/pages/footer.dart';
import 'package:book_recomended/pages/into_catalog_popular_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/pages.dart';
import 'pages/regestration_form_page.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    return MaterialApp(
      // theme: ThemeData(fontFamily: "OpenSans"),
      title: "Register Form Demo",
      home: AuthorizationFormPage(),
      routes: {
        Pages.RegisterFormPage.toString():(context) => RegisterFormPage(),
        Pages.AuthorizationFormPage.toString():(context) => AuthorizationFormPage(),
        Pages.CardPage.toString():(context) => SwipeInterfaceApp(),
        Pages.CatalogPage.toString():(context) => CatalogPage(),
        Pages.StatisticPage.toString():(context) => StatisticPage(),
        Pages.PeoplePage.toString():(context) => PeoplePage(),
        Pages.ProfilePage.toString():(context) => ProfilePage(),
        Pages.FooterPage.toString():(context) => Footer(),
        Pages.SettingPage.toString():(context) => SettingPage(),
        Pages.IntoCatalogPopularPage.toString():(context) => IntoCatalogPopularPage(),
        Pages.IntoCatalogLiterPage.toString():(context) => IntoCatalogLiterPage(),
        Pages.IntoCatalogNotLiterPage.toString():(context) => IntoCatalogNotLiterPage(),
        Pages.IntoCatalogComicsPage.toString():(context) => IntoCatalogComicsPage(),
        Pages.IntoCatalogAllBooksPage.toString():(context) => IntoCatalogAllBooksPage(),
      },
    );
  }
}



