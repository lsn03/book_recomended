

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({super.key});

  @override
  State<RegisterFormPage> createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register form"),
        centerTitle: true,
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Имя *",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Фамилия",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Почта *"),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Пароль *"),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Повторите пароль *"),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Социальная сеть"),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Дата рождения *"),
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 30,
                  width: 125,
                  child: ElevatedButton(
                    onPressed: (() {}),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 252, 255, 220),
                    ),
                    child: Text(
                      "Назад",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,  
                        ),
                        
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 125,
                  child: ElevatedButton(
                    onPressed: (() {}),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD0FFD2),
                      
                    ),
                    
                    child: Text(
                      "Отправить",
                      style: TextStyle(fontSize: 15,color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
