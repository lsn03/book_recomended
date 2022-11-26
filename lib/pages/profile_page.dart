import 'package:book_recomended/pages/footer.dart';
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
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              )),
        ],
        automaticallyImplyLeading: false,
        //toolbarHeight: 0,
        backgroundColor: Color(0xFFD1FFD2),
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

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        
        Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              
              Column(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 60,
                  ),
                  Text("Ирина"),
                ],
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
                    Text("Нравится: "),
                    Text("Не нравится: "),
                    Text("Хочет прочитать: "),
                    Text("Соц.сеть: "),
                  ],
                ),
                SizedBox(width: 120,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    
                    Text(" 125 книг "),
                    Text("13 книг"),
                    Text("200 книг"),
                    Text("t.me/reenashka"),
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
                  Text("Предпочитаемые жанры:"),
                   Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      
                      Text("Фентези, приключения,современная проза, пьесы, научная фантастика, комедия, драма"),
                    
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
