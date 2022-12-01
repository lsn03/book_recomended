import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:book_recomended/pages/pages.dart';
import 'package:book_recomended/pages/into_catalog_popular_page.dart';
import 'package:book_recomended/pages/into_catalog_liter_page.dart';
import 'package:book_recomended/pages/into_catalog_notliter_page.dart';
import 'package:book_recomended/pages/into_catalog_comisc_page.dart';
import 'package:book_recomended/pages/into_catalog_allbooks_page.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(70, 155, 150, 1),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/BackMain.jpg"),
            fit: BoxFit.fill,
          )
        ),
        child: Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: SizedBox(
                  width: 300,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(195, 175, 152, 1),
                    ),
                    onPressed: (() {
                      Navigator.pushNamed(context, Pages.IntoCatalogPopularPage);
                    }),
                    child: Text("Популярное", style: TextStyle(
                      fontSize: 24,
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: "OpenSans",
                    ),),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: SizedBox(
                  width: 300,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(195, 175, 152, 1),
                    ),
                    onPressed: ( (){
                      Navigator.pushNamed(context, Pages.IntoCatalogLiterPage);
                    }),
                    child: Text("Художественная литература", style: TextStyle(
                      fontSize: 24,
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: "OpenSans",
                    ),),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: SizedBox(
                  width: 300,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(195, 175, 152, 1),
                    ),
                    onPressed: ( (){
                      Navigator.pushNamed(context, Pages.IntoCatalogNotLiterPage);
                    }),
                    child: Text("Нехудожественная литература", style: TextStyle(
                      fontSize: 24,
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: "OpenSans",
                    ),),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: SizedBox(
                  width: 300,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(195, 175, 152, 1),
                    ),
                    onPressed: (() {
                      Navigator.pushNamed(context, Pages.IntoCatalogComicsPage);
                    }),
                    child: Text("Комиксы, Манга, Артбуки", style: TextStyle(
                      fontSize: 24,
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: "OpenSans",
                    ),),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: SizedBox(
                  width: 300,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(195, 175, 152, 1),
                    ),
                    onPressed: (() {
                      Navigator.pushNamed(context, Pages.IntoCatalogAllBooksPage);
                    }),
                    child: Text("Все книги", style: TextStyle(
                      fontSize: 24,
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: "OpenSans",
                    ),),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}

// final double wdth = 300;
// final double hght = 50;
// final double fs = 17;
//
// Widget buildBody() {
//   return Container(
//     decoration: BoxDecoration(color: Color.fromRGBO(242, 241, 229, 1)),
//     child: Align(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Padding(
//             padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//             child: SizedBox(
//               width: wdth,
//               height: 60,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color.fromRGBO(195, 175, 152, 1),
//                 ),
//                 onPressed: (() {
//                   Navigator.pushNamed(context, Pages.IntoCatalogPopularPage);
//                 }),
//                 child: Text("Популярное", style: TextStyle(
//                   fontSize: 19,
//                   color: Color.fromRGBO(0, 0, 0, 1),
//                 ),),
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//             child: SizedBox(
//               width: wdth,
//               height: 60,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color.fromRGBO(195, 175, 152, 1),
//                 ),
//                 onPressed: () {},
//                 child: Text("Художественная литература", style: TextStyle(
//                   fontSize: 19,
//                   color: Color.fromRGBO(0, 0, 0, 1),
//                 ),),
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//             child: SizedBox(
//               width: wdth,
//               height: 60,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color.fromRGBO(195, 175, 152, 1),
//                 ),
//                 onPressed: () {},
//                 child: Text("Нехудожественная литература", style: TextStyle(
//                   fontSize: 18,
//                   color: Color.fromRGBO(0, 0, 0, 1),
//                 ),),
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//             child: SizedBox(
//               width: wdth,
//               height: 60,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color.fromRGBO(195, 175, 152, 1),
//                 ),
//                 onPressed: () {},
//                 child: Text("Комиксы, Манга, Артбуки", style: TextStyle(
//                   fontSize: 19,
//                   color: Color.fromRGBO(0, 0, 0, 1),
//                 ),),
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//             child: SizedBox(
//               width: wdth,
//               height: 60,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color.fromRGBO(195, 175, 152, 1),
//                 ),
//                 onPressed: () {},
//                 child: Text("Все книги", style: TextStyle(
//                   fontSize: 19,
//                   color: Color.fromRGBO(0, 0, 0, 1),
//                 ),),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
