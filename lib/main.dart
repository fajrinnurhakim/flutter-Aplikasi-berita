import 'package:flutter/material.dart';
import 'package:ittpnews/about_page.dart';
import 'package:ittpnews/home_page.dart';
import 'package:ittpnews/login_page.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: MyBottomNavigationBar(),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    AboutPage(),
    LoginPage()
    
  ];

  void onTappedBar(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        backgroundColor: Colors.redAccent,
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home_sharp,),
            label: ("Home"),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.supervised_user_circle_sharp,),
            label: ("About" ),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.account_circle_sharp,),
            label: ("Login"),
          ),
        ],
      ),
    );
  }
}