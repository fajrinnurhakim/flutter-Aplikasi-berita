import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ittpnews/admin_page.dart';
import 'package:ittpnews/splash.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = "temp";
  String _password = "temp";
  String _erorMessage = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.redAccent,
        title: new Text("Halaman Login"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 40),
              height: 175,
              width: 200,
              child: Image.asset('image/splash.png'),
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'alamat email anda',
              ),
              onChanged: (text) {
                _email = text;
              } ,
            ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'password',
                hintText: 'password anda',
                ),
                onChanged: (Text){
                  _password = Text;
                },
              ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _erorMessage,
                  style: TextStyle(color: Colors.red),
                ),  
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.redAccent, borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          if (_email == "ittpnews@gmail.com" && _password == "Beritakampus"){
                            _erorMessage = "";
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SplashScreenPage() ));
                          }else {
                            _erorMessage = "email dan password anda salah";
                          }
                        });
                      },
                      child: Text( "Login",
                      
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      ), 
                    ),
                )
        ]),
        ),
    );
  }
}