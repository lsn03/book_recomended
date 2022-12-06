import 'package:book_recomended/backend/mysql.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:book_recomended/pages/pages.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthorizationFormPage extends StatefulWidget {
  const AuthorizationFormPage({super.key});

  @override
  State<AuthorizationFormPage> createState() => _AuthorizationFormPageState();
}

class _AuthorizationFormPageState extends State<AuthorizationFormPage> {
  bool _hidePass = true;
  bool? error;
  String? errorMessage;
  bool isReg = false;
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  void initState() {
    _getUser();
    super.initState();
  }
  _getUser() async {
    final prefs = await SharedPreferences.getInstance();
    //print(prefs);
    print("31\t"+ prefs.getString("userEmail").toString());
    if (prefs.containsKey('userEmail')){
        Navigator.pushReplacementNamed(context, Pages.FooterPage);
    }
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Вход"),
      //   centerTitle: true,
      // ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/backAu_Reg.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Align(
          child: Container(
            height: 550,
            width: 412,
            margin: EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              color: Color.fromRGBO(70, 155, 150, 1),
              border: Border.all(color: Color.fromRGBO(70, 155, 150, 1)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Form(
              child: ListView(padding: EdgeInsets.all(16), children: [
                Align(
                  child: Text(
                    "Вход",
                    style: TextStyle(
                      fontSize: 50,
                      color: Color.fromRGBO(219, 216, 178, 1),
                      fontFamily: "OpenSans",
                    ),
                  ),
                  alignment: Alignment.topCenter,
                ),
                SizedBox(
                  height: 80,
                ),
                // Text("Mail"),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
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
                      // labelText: "Почта *",
                      hintText: "Почта",
                      suffixIcon: Icon(Icons.mail, color: Color.fromRGBO(39, 59, 74, 1),),
                      // helperText: "Формат user@gmail.com",
                      // icon: Icon(Icons.mail),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(235, 226, 215, 1), width: 0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(235, 226, 215, 1),
                          width: 0,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 40,
                  ),
                  child: TextFormField(
                    style: TextStyle(color: Color.fromRGBO(58, 106, 103, 1)),
                    controller: _passController,
                    obscureText: _hidePass,
                    maxLength: 30,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(15),
                      filled: true,
                      fillColor: Color.fromRGBO(235, 226, 215, 1),
                      //labelText: "Пароль *",
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(58, 106, 103, 1)),
                      hintText: "Пароль",
                      //helperText: "Длина пароля не более 30 символов",
                      //icon: Icon(Icons.key),
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
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(235, 226, 215, 1), width: 0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(235, 226, 215, 1),
                          width: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(39, 22, 39, 2),
                  child: ElevatedButton(
                     onPressed: startAuthorization,
                   // onPressed: (() {
                    //  Navigator.pushNamed(context, Pages.FooterPage);
                   // }),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(195, 175, 152, 1),
                    ),
                    child: Text(
                      "Войти",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(242, 241, 230, 1),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 39,
                    vertical: 0,
                  ),
                  child: ElevatedButton(
                      onPressed: (() {
                        Navigator.pushNamed(context, Pages.RegisterFormPage);
                      }),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(195, 175, 152, 1),
                      ),
                      child: Text(
                        "Регистрация",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(242, 241, 230, 1),
                        ),
                      )),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  startAuthorization() async {
    String apiurl = Mysql.login; //"http://192.168.241.11/love&read/login.php";
    var response = await http.post(
      Uri.parse(apiurl),
      body: {
        'email': _emailController.text.toString(),
        'password': _passController.text.toString(),
      },
      //headers: {'Accept': 'application/json'},
    );
    if (response.body.toString() == "{\"login\":true}") {
      isReg = true;
      print("isreg??????");
     
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("userEmail", _emailController.text.toString());
     

      Navigator.pushReplacementNamed(context, Pages.FooterPage);
      //Navigator.pushNamed(context, Pages.FooterPage);
    } else {
      error = true;
      errorMessage = response.body.toString();
      print(errorMessage);
    }
  }
}
