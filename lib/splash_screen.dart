import 'package:flutter/material.dart';
import 'package:hive_db_crud/home_page.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: MyHomePage(),
      loadingText: Text("Loading.....",style: TextStyle(fontSize: 30,color: Colors.white),),
      gradientBackground: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Colors.teal, Colors.deepPurple,Colors.red],
      ),
      title: Text("Welcome",style: TextStyle(fontSize: 30,color: Colors.white),),
    );
  }
}
