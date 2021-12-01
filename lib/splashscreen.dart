import 'dart:async';
import 'package:flutter/material.dart';
import 'package:web_view_flutter_app/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF304FFE),
                Color(0xFFF0F2F5)
              ],
          ),

        ),
        child : Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children : [
                Image.asset(
                    'img/user.png', height: 300, width: 300
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}
