import 'dart:convert';
import 'dart:developer';

import 'package:book_recomended/Others/CustomIcons.dart';
import 'package:book_recomended/backend/mysql.dart';
import 'package:http/http.dart' as http;
import 'package:book_recomended/pages/footer.dart';
import 'package:book_recomended/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtherPeopleProfilePage extends StatefulWidget {
  const OtherPeopleProfilePage({super.key});

  @override
  State<OtherPeopleProfilePage> createState() => _OtherPeopleProfileState();
}

String? userEmail;

class _OtherPeopleProfileState extends State<OtherPeopleProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Align(
            child: IconButton(
              onPressed: (() {
                Navigator.pushNamed(context, Pages.AuthorizationFormPage);
              }),
              icon: Icon(
                Icons.exit_to_app_outlined,
                color: Color.fromRGBO(195, 175, 152, 1),
                size: 40,
              ),
            ),
            alignment: Alignment.centerRight,
          ),

          // IconButton(
          //   alignment: Alignment.centerRight,
          //   onPressed: (() {
          //     Navigator.pushNamed(context, Pages.SettingPage);
          //   }),
          //   icon: Icon(
          //     Icons.settings,
          //     color: Color.fromRGBO(195, 175, 152, 1),
          //     size: 40,
          //   ),
          // ),
        ],
        backgroundColor: Color.fromRGBO(70, 155, 152, 1),
        automaticallyImplyLeading: false,
        //toolbarHeight: 0,
      ),
      body: Profile(),
      floatingActionButton: new FloatingActionButton(onPressed: ((){
        Navigator.pop(context, Pages.PeoplePage);
      }), backgroundColor: Color.fromRGBO(70, 155, 150, 1), child: Icon(Icons.arrow_back_ios_new_rounded,size: 30,),),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}

int cntNrav = 100;
int cntNeNrav = -1;
int cntWannaRead = -1;
String userName = "";
bool init = false;

FetchDataAppbar() async {
  final prefs = await SharedPreferences.getInstance();
  //print("FetchData");
  print("FetchDataAppbar" + "\r");
}

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

final double fs = 20;

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    FetchData();
    super.initState();
  }

  FetchData() async {
    final prefs = await SharedPreferences.getInstance();
    //print("FetchData" +"\r");
    if (prefs.containsKey("userEmail") && !init) {
      //&& userEmail==null &&cntNrav==null) {
      init = true;

      userEmail = prefs.getString("userEmail");
      //print(userEmail);

      String apiurl = Mysql.profile;
      //print(apiurl);
      // "http://192.168.241.11/love&read/profile.php";
      var response =
          await http.post(Uri.parse(apiurl), body: {'email': userEmail}
              //headers: {'Accept': 'application/json'},
              );
      print(response.body);
      Map<String, dynamic> res = jsonDecode(response.body);
      userName = res["first_name"];
      cntNrav = int.parse(res["cnt_of_like_book"]);
      cntNeNrav = int.parse(res["cnt_of_dislike_book"]);
      cntWannaRead = int.parse(res["cnt_of_wishes_book"]);
      prefs.setInt("cntNrav", cntNrav);
      prefs.setInt("cntNeNrav", cntNeNrav);
      prefs.setInt("cntWannaRead", cntWannaRead);
      prefs.setString("userName", userName);
      /*
      print(userName);
      print(cntNrav);
      print(cntNeNrav);
      print(cntWannaRead);
      */
      //print(response.body);

      setState(() {
        log("setstate");
        userName = res["first_name"];
        cntNrav = int.parse(res["cnt_of_like_book"]);
        cntNeNrav = int.parse(res["cnt_of_dislike_book"]);
        cntWannaRead = int.parse(res["cnt_of_wishes_book"]);
      });

      if (response.body.toString() == "{\"login\":true}") {
        //Navigator.pushNamed(context, Pages.FooterPage);
      } else {}
    } else {
      if (userName == "") {
        log("Exception nahui");
      } else
        log("пользователь уже занесен");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/image/BackMain.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Align(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 160,
                    width: 125,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(70, 155, 150, 1),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                          child: Container(
                            height: 130,
                            width: 125,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage("assets/image/OrangeBoy.png"),
                              fit: BoxFit.fill,
                            )),
                          ),
                        ),
                        Container(
                          height: 25,
                          width: 125,
                          child: Align(
                            child: Text(
                              "Джереми",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "OpenSans",
                                  color: Color.fromRGBO(242, 241, 229, 1)),
                            ),
                            alignment: Alignment.topCenter,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            alignment: Alignment.topCenter,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(33, 0, 13.5, 0),
                  child: Container(
                    height: 100,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(70, 155, 150, 1),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: ListView(
                      children: [
                        Container(
                          height: 80,
                          width: 90,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(195, 175, 152, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 9, 0),
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Icon(
                                  CustomIcons.heart,
                                  color: Color.fromRGBO(70, 155, 152, 1),
                                  size: 30,
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(9, 0, 0, 0),
                                  child: Text(
                                    "$cntNrav",
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(242, 241, 229, 1)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 20,
                          width: 90,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(70, 155, 150, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Align(
                            child: Text(
                              "Нравится",
                              style: TextStyle(
                                  fontSize: 12, fontFamily: "OpenSans"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 13.5, 0),
                  child: Container(
                    height: 100,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(70, 155, 150, 1),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: ListView(
                      children: [
                        Container(
                          height: 80,
                          width: 90,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(195, 175, 152, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 9, 0),
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Icon(
                                  CustomIcons.broken_heart,
                                  color: Color.fromRGBO(70, 155, 152, 1),
                                  size: 30,
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(9, 0, 0, 0),
                                  child: Text(
                                    "$cntNeNrav",
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(242, 241, 229, 1)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 20,
                          width: 90,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(70, 155, 150, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Align(
                            child: Text(
                              "Не нравится",
                              style: TextStyle(
                                  fontSize: 12, fontFamily: "OpenSans"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 33, 0),
                  child: Container(
                    height: 100,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(70, 155, 150, 1),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: ListView(
                      children: [
                        Container(
                          height: 80,
                          width: 90,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(195, 175, 152, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 9, 0),
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Icon(
                                  CustomIcons.open_book,
                                  color: Color.fromRGBO(70, 155, 152, 1),
                                  size: 30,
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(9, 0, 0, 0),
                                  child: Text(
                                    "$cntWannaRead",
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(242, 241, 229, 1)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 20,
                          width: 90,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(70, 155, 150, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Align(
                            child: Text(
                              "В планах",
                              style: TextStyle(
                                  fontSize: 12, fontFamily: "OpenSans"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Container(
              height: 50,
              width: 275,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(195, 175, 152, 1),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                      blurRadius: 2.0,
                      offset: Offset(0, 3),
                    )
                  ]),
              child: Align(
                child: Text(
                  "Something",
                  style: TextStyle(fontFamily: "OpenSans"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
