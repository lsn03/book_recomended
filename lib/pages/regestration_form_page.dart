import 'dart:convert';
import 'dart:developer';
import 'package:book_recomended/pages/pages.dart';
import 'package:book_recomended/backend/mysql.dart';
import 'package:book_recomended/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({super.key});

  @override
  State<RegisterFormPage> createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  bool _hidePass = true;
  String? errorMessage;
  bool? error;
  bool isReg = false;
  //var db = new Mysql();

  final _firstNameController = TextEditingController();
  final _secondNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();
  final _socialmediaController = TextEditingController();
  final _birthdayController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _secondNameController.dispose();
    _emailController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
    _socialmediaController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  startRegistration() async {
    String apiurl = "http://192.168.183.11/love&read/signup.php";

    final Map<String, dynamic> registrationData = {
      'first_name': _firstNameController.text.toString(),
      'second_name': _secondNameController.text.toString(),
      'email': _emailController.text.toString(),
      'password': _passController.text.toString(),
      'birthday': _birthdayController.text.toString(),
      'password_confirm': _confirmPassController.text.toString(),
    };

    var response = await http.post(
      Uri.parse(apiurl),
      body: {
        'first_name': _firstNameController.text.toString(),
        'second_name': _secondNameController.text.toString(),
        'email': _emailController.text.toString(),
        'password': _passController.text.toString(),
        'birthday': _birthdayController.text.toString(),
        'password_confirm': _confirmPassController.text.toString(),
      },
      //headers: {'Accept': 'application/json'},
    );
    var responseBodySignUp = (response.body);
    //print(response.body);
    if (response.body.toString() == "{\"signup\":true}" ){
      error = false;
      isReg = true;
    }else{
      error = true;
      errorMessage = response.body.toString();
      print(errorMessage);
    }
    /*
    var result = response.body.replaceAll("[","");
    result = result.replaceAll("]","");
     result = result.replaceAll(","," ");
     result = result.replaceAll("{","");
     result = result.replaceAll("}","");
     result = result.replaceAll("\"","");
    print((result));
    var res = result.split(" ");
    List<String> finalResult ;
   // print(res[0].indexOf(":"));
    print((res[0].substring(res[0].indexOf(":")+1)).trim());
    */
   // print(response.body.split("=>")[0]);
   // print(response.body.split("=>")[1]);
    //print(response.body.split("=>")[2]);
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Регистрация"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.question_mark)),
        ],
        centerTitle: true,
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(
                labelText: "Имя *",
                hintText: "Введите ваше имя",
                icon: Icon(Icons.person),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _secondNameController,
              decoration: InputDecoration(
                labelText: "Фамилия",
                hintText: "Введите вашу фамилию",
                icon: Icon(Icons.person),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Почта *",
                hintText: "Введите вашу почту",
                helperText: "Формат user@gmail.com",
                icon: Icon(Icons.mail),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passController,
              obscureText: _hidePass,
              maxLength: 30,
              decoration: InputDecoration(
                labelText: "Пароль *",
                hintText: "A-Z, 0-9",
                helperText: "Длина пароля не более 30 символов",
                icon: Icon(Icons.key),
                suffixIcon: IconButton(
                  icon:
                      Icon(_hidePass ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _hidePass = !_hidePass;
                    });
                  },
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _confirmPassController,
              obscureText: _hidePass,
              maxLength: 30,
              decoration: InputDecoration(
                labelText: "Повторите пароль *",
                icon: Icon(Icons.key),

                //suffixIcon: Icon(Icons.remove_red_eye),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _socialmediaController,
              decoration: InputDecoration(
                labelText: "Социальная сеть",
                icon: Icon(Icons.people_alt),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _birthdayController,
              decoration: InputDecoration(
                labelText: "Дата рождения *",
                icon: Icon(Icons.cake),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
              ),
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
                    onPressed: (() {
                      // Navigator.pushNamed(context, "/page1");
                      Navigator.pop(context);
                    }),
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
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD0FFD2),
                    ),
                    child: Text(
                      "Отправить",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
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

  void _submitForm() {
    startRegistration();
    
    if(isReg){
      Navigator.pushNamed(context, Pages.FooterPage);
    }
/*
    print("first: ${_firstNameController.text}");
    print("second: ${_secondNameController.text}");
    print("email: ${_emailController.text}");
    print("pass: ${_passController.text}");
    print("confPass: ${_confirmPassController.text}");
    print("social: ${_socialmediaController.text}");
    print("birthday: ${_birthdayController.text}");
  */
  }

  void fetchData() {
    // db.getConnection().then((conn) {
    String sql1 = 'Select * from `таблица поставок spj`;';
    // conn.query(sql1).then((result) {
    // for (var row in result){
    // print(row[0]);
  }

}
