import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ittpnews/admin_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({ Key? key }) : super(key: key);
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}
class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    openSplashScreen();
  }
  openSplashScreen() async {
    var durasiSplash = const Duration(seconds: 2);
    return Timer(durasiSplash, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return AdminPage();
        })
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          "image/splash.png",
          width: 250,
          height: 250,
        ),
      ),
    );
  }
}