

import 'package:book_recomended/pages/footer.dart';
import 'package:book_recomended/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}
final double fs = 20;
class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        
        Padding(
          padding: EdgeInsets.fromLTRB(0,0,0,10),
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
                      Text("Ирина",style: TextStyle(fontSize: fs+4,),),
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
                    Text("Нравится: ",style: TextStyle(fontSize: fs,),),
                    Text("Не нравится: ",style: TextStyle(fontSize: fs,),),
                    Text("Хочет прочитать: ",style: TextStyle(fontSize: fs,),),
                    Text("Соц.сеть: ",style: TextStyle(fontSize: fs,),),
                  ],
                ),
                SizedBox(width: 35,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    
                    Text("125 книг ",style: TextStyle(fontSize: fs,),),
                    Text("13 книг",style: TextStyle(fontSize: fs,),),
                    Text("200 книг",style: TextStyle(fontSize: fs,),),
                    Text("t.me/reenashka",style: TextStyle(fontSize: fs,),),
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
                  Text("Предпочитаемые жанры:",style: TextStyle(fontSize: fs+2,fontStyle: FontStyle.italic),),
                   Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      
                      Text(
                        "Фентези, приключения,современная проза, пьесы, научная фантастика, комедия, драма",
                        style: TextStyle(fontSize: fs,),
                      )
                    ]),
                ]
              ),
            ),

              
            
          ],
        ),
         
      ],
    );
  }
}

