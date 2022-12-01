import 'dart:convert';
import 'dart:developer';

import 'package:book_recomended/backend/mysql.dart';
import 'package:http/http.dart' as http;
import 'package:book_recomended/pages/footer.dart';
import 'package:book_recomended/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

String? userEmail;

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (() {
                Navigator.pushNamed(context, Pages.SettingPage);
              }),
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              )),
        ],
        automaticallyImplyLeading: false,
        //toolbarHeight: 0,
      ),
      body: Profile(),
    );
  }
}

int cntNrav = -1;
int cntNeNrav=-1;
int cntWannaRead=-1;
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
    if (prefs.containsKey("userEmail") && !init){//&& userEmail==null &&cntNrav==null) {
      init = true;
      
      userEmail = prefs.getString("userEmail");
      //print(userEmail);

      String apiurl = Mysql.profile;
      //print(apiurl);
      // "http://192.168.241.11/love&read/profile.php";
      var response = await http
          .post(Uri.parse(apiurl), body: {'email': userEmail}
              //headers: {'Accept': 'application/json'},
              );
      print(response.body);
      Map<String, dynamic> res = jsonDecode( response.body);
      userName = res["first_name"]+" "+res["second_name"];
      cntNrav =int.parse(res["cnt_of_like_book"]);
      cntNeNrav = int.parse(res["cnt_of_dislike_book"]);
      cntWannaRead = int.parse(res["cnt_of_wishes_book"]);
      prefs.setInt("cntNrav", cntNrav);
      prefs.setInt("cntNeNrav", cntNeNrav);
      prefs.setInt("cntWannaRead", cntWannaRead);
      prefs.setString("userName", userName);
      print(userName);
      print(cntNrav);
      print(cntNeNrav);
      print(cntWannaRead);
      //print(response.body);

      setState(() {
        log("setstate");
        userName = res["first_name"]+" "+res["second_name"];
        cntNrav =int.parse(res["cnt_of_like_book"]);
        cntNeNrav = int.parse(res["cnt_of_dislike_book"]);
        cntWannaRead = int.parse(res["cnt_of_wishes_book"]);
      });

      if (response.body.toString() == "{\"login\":true}") {
        //Navigator.pushNamed(context, Pages.FooterPage);
      } else {}
    }else{

      if(userName==""){
        log("Exception nahui");
      }
      else
        log("пользователь уже занесен");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // backgroundColor: Color(0xFFD1FFD2),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFD1FFD2),
                ),
                width: 390,
                height: 180,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        radius: 60,
                      ),
                      Text(
                        "$userName",
                        style: TextStyle(
                          fontSize: fs + 4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
              //mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Нравится: ",
                      style: TextStyle(
                        fontSize: fs,
                      ),
                    ),
                    Text(
                      "Не нравится: ",
                      style: TextStyle(
                        fontSize: fs,
                      ),
                    ),
                    Text(
                      "Хочет прочитать: ",
                      style: TextStyle(
                        fontSize: fs,
                      ),
                    ),
                    
                  ],
                ),
                SizedBox(
                  width: 35,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "$cntNrav книг ",
                      style: TextStyle(
                        fontSize: fs,
                      ),
                    ),
                    Text(
                      "$cntNeNrav книг",
                      style: TextStyle(
                        fontSize: fs,
                      ),
                    ),
                    Text(
                      "$cntWannaRead книг",
                      style: TextStyle(
                        fontSize: fs,
                      ),
                    ),
                    
                  ],
                ),
              ]),
        ),
        Column(
          //mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Предпочитаемые жанры:",
                      style: TextStyle(
                          fontSize: fs + 2, fontStyle: FontStyle.italic),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Фентези, приключения,современная проза, пьесы, научная фантастика, комедия, драма",
                            style: TextStyle(
                              fontSize: fs,
                            ),
                          )
                        ]),
                  ]),
            ),
          ],
        ),
      ],
    );
  }
}
