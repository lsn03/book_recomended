import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:book_recomended/pages/pages.dart';

class AuthorizationFormPage extends StatefulWidget {
  const AuthorizationFormPage({super.key});

  @override
  State<AuthorizationFormPage> createState() => _AuthorizationFormPageState();
}

class _AuthorizationFormPageState extends State<AuthorizationFormPage> {
  bool _hidePass = true;

  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Вход"),
        centerTitle: true,
      ),
      body: Form(
        child: ListView(padding: EdgeInsets.all(16), children: [
          
            SizedBox(height: 180,),
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
              height: 20,
            ),
            ElevatedButton(
              onPressed: (() {
                Navigator.pushNamed(context, Pages.FooterPage);
              }),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFCFFFBE),
              ),
              child: Text(
                "Войти",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Или"),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: (() {
                  Navigator.pushNamed(context, Pages.RegisterFormPage);
                }),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 252, 255, 220),
                ),
                child: Text(
                  "Регистрация",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                )),
          ]),
        
      ),
    );
  }
}