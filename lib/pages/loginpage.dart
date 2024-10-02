import 'package:flutter/material.dart';

import 'homepage.dart';

class loginpage extends StatefulWidget {
  loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  String _username = '';
  String? nickname;
  String password = '';
  bool isloginsuccess = true;
  bool visible = true;

  _kehalutama() async {
    await Future.delayed(Duration(seconds: 0));

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Homepage(
                  nickname: nickname,
                  username: _username,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Login"),
          ),
          body: Column(
            children: [
              _usernameField(),
              _passwordField(),
              _nicknameField(),
              _loginbutton(context),
            ],
          )),
    );
  }

  Widget _nicknameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          nickname = value;
        },
        decoration: InputDecoration(
            hintText: 'Nickname',
            contentPadding: EdgeInsets.all(8),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                    color: const Color.fromARGB(255, 83, 106, 222)))),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          _username = value;
        },
        decoration: InputDecoration(
            hintText: 'Username',
            contentPadding: EdgeInsets.all(8),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                    color: const Color.fromARGB(255, 83, 106, 222)))),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          password = value;
        },
        obscureText: visible,
        decoration: InputDecoration(
            suffix: IconButton(
                onPressed: () {
                  setState(() {
                    visible = !visible;
                  });
                },
                icon: Icon(Icons.visibility)),
            hintText: 'Username',
            contentPadding: EdgeInsets.all(8),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide:
                    BorderSide(color: const Color.fromARGB(255, 222, 83, 83)))),
      ),
    );
  }

  Widget _loginbutton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          onPressed: () {
            String text = '';
            if (_username == 'wahyu' && password == 'wahyu') {
              _kehalutama();
              text = "Login berhasil";
              isloginsuccess = true;
            } else {
              text = "Login gagal";
              isloginsuccess = false;
            }
            SnackBar snackBar = SnackBar(
              content: Text(text),
              backgroundColor: isloginsuccess ? Colors.green : Colors.red,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            print(text);
          },
          child: Text('Login')),
    );
  }
}
