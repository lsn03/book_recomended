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
      'password_confirmation': _confirmPassController.text.toString(),
    };

    /*var response =  await http.post(Uri.parse(apiurl),
        body: jsonEncode(registrationData),
        headers: {'Content-Type': 'application/json'});
    
    response;
  log( response.body.toString());
  //print(response.body);
   */
    /* await http.post(Uri.parse( apiurl), body: {'name':'test','num':'10'}, headers: {'Accept':'application/json'},).then((response) {
  print("Response status: ${response.statusCode}");
  print("Response body: ${response.body}");
}).catchError((error){
  print("Error: $error");
});
*/
    var response = await http.post(
      Uri.parse(apiurl),
      body: {
        'first_name': _firstNameController.text.toString(),
        'second_name': _secondNameController.text.toString(),
        'email': _emailController.text.toString(),
        'password': _passController.text.toString(),
        'birthday': _birthdayController.text.toString(),
        'password_confirmation': _confirmPassController.text.toString(),
      },
      headers: {'Accept': 'application/json'},
    );
    print(response.body);
    //var data = jsonDecode(response.body);
    //print(response);
    //.then(onValue)1
    // .catchError(onError);
  }

  void getMethod() async {
    User people = User(
        _firstNameController.text.trim(),
        _secondNameController.text.trim(),
        _emailController.text.trim(),
        _passController.text.trim(),
        _birthdayController.text.trim());

    try {
      var res = await http.post(
        Uri.parse(Mysql.signUp),
        body: people.toJson(),
      );

      if (res.statusCode == 200) {
        var resBodySignUp = jsonDecode(res.body);
        if (resBodySignUp['success'] == true) {
          print("Succsessful sign up");
        } else {
          print("????????????");
        }
      }
    } catch (e) {
      print(e.toString() + "\t????????????");
    }
    // var res = await http.get(Uri.parse(theUrl));

    //var responseBody = jsonDecode(res.body);
    // print(responseBody);
    //return responseBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/backAu_Reg.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Align(
          child: Container(
            height: 613,
            width: 412,
            margin: EdgeInsets.symmetric(
              horizontal: 41,
            ),
            decoration: BoxDecoration(
              color: Color.fromRGBO(70, 155, 150, 1),
              border: Border.all(color: Color.fromRGBO(70, 155, 150, 1)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: ElevatedButton(
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 25,
                            color: Color.fromRGBO(70, 155, 150, 1),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(219, 216, 178, 1),
                            shape: const CircleBorder(),
                            fixedSize: const Size(40, 40),
                          ),
                          onPressed: (() {
                            Navigator.pushNamed(
                                context, Pages.AuthorizationFormPage);
                          }),
                        ),
                      ),
                      Text(
                        "??????????????????????",
                        style: TextStyle(
                          fontSize: 40,
                          color: Color.fromRGBO(219, 216, 178, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  child: TextFormField(
                    style: TextStyle(color: Color.fromRGBO(58, 106, 103, 1)),
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(15),
                      filled: true,
                      fillColor: Color.fromRGBO(235, 226, 215, 1),
                      hintStyle:
                      TextStyle(color: Color.fromRGBO(58, 106, 103, 1)),
                      hintText: "??????",
                      suffixIcon: Icon(Icons.person, color: Color.fromRGBO(39, 59, 74, 1),),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(235, 226, 215, 1), width: 0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(235, 226, 215, 1),
                          width: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  child: TextFormField(
                    style: TextStyle(color: Color.fromRGBO(58, 106, 103, 1)),
                    controller: _emailController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(15),
                      filled: true,
                      fillColor: Color.fromRGBO(235, 226, 215, 1),
                      hintStyle:
                      TextStyle(color: Color.fromRGBO(58, 106, 103, 1)),
                      hintText: "??????????",
                      suffixIcon: Icon(Icons.mail, color: Color.fromRGBO(39, 59, 74, 1),),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(235, 226, 215, 1), width: 0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(235, 226, 215, 1),
                          width: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  child: TextFormField(
                    style: TextStyle(color: Color.fromRGBO(58, 106, 103, 1)),
                    controller: _passController,
                    obscureText: _hidePass,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(15),
                      filled: true,
                      fillColor: Color.fromRGBO(235, 226, 215, 1),
                      hintStyle:
                      TextStyle(color: Color.fromRGBO(58, 106, 103, 1)),
                      hintText: "????????????",
                      suffixIcon: IconButton(
                        icon: Icon(_hidePass
                            ? Icons.visibility
                            : Icons.visibility_off, color: Color.fromRGBO(39, 59, 74, 1),),
                        onPressed: () {
                          setState(() {
                            _hidePass = !_hidePass;
                          });
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(235, 226, 215, 1), width: 0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(235, 226, 215, 1),
                          width: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  child: TextFormField(
                    style: TextStyle(color: Color.fromRGBO(58, 106, 103, 1)),
                    controller: _passController,
                    obscureText: _hidePass,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(15),
                      filled: true,
                      fillColor: Color.fromRGBO(235, 226, 215, 1),
                      hintStyle:
                      TextStyle(color: Color.fromRGBO(58, 106, 103, 1)),
                      hintText: "?????????????????? ????????????",
                      suffixIcon: IconButton(
                        icon: Icon(_hidePass
                            ? Icons.visibility
                            : Icons.visibility_off, color: Color.fromRGBO(39, 59, 74, 1),),
                        onPressed: () {
                          setState(() {
                            _hidePass = !_hidePass;
                          });
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(235, 226, 215, 1), width: 0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(235, 226, 215, 1),
                          width: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  child: TextFormField(
                    style: TextStyle(color: Color.fromRGBO(58, 106, 103, 1)),
                    controller: _birthdayController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(15),
                      filled: true,
                      fillColor: Color.fromRGBO(235, 226, 215, 1),
                      hintStyle:
                      TextStyle(color: Color.fromRGBO(58, 106, 103, 1)),
                      hintText: "???????? ????????????????",
                      suffixIcon: Icon(Icons.calendar_month_sharp, color: Color.fromRGBO(39, 59, 74, 1),),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(235, 226, 215, 1), width: 0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(235, 226, 215, 1),
                          width: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(39, 50, 39, 2),
                  child: ElevatedButton(
                    onPressed: (() {
                      Navigator.pushNamed(context, Pages.FooterPage);
                    }),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(195, 175, 152, 1),
                    ),
                    child: Text(
                      "??????????",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(242, 241, 230, 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    Navigator.pushNamed(context, Pages.FooterPage);
    startRegistration();
    //Navigator.pushNamed(context, Pages.FooterPage);
    print("first: ${_firstNameController.text}");
    print("second: ${_secondNameController.text}");
    print("email: ${_emailController.text}");
    print("pass: ${_passController.text}");
    print("confPass: ${_confirmPassController.text}");
    print("social: ${_socialmediaController.text}");
    print("birthday: ${_birthdayController.text}");
  }

  void fetchData() {
    // db.getConnection().then((conn) {
    String sql1 = 'Select * from `?????????????? ???????????????? spj`;';
    // conn.query(sql1).then((result) {
    // for (var row in result){
    // print(row[0]);
  }
//});
//});
//}
}
