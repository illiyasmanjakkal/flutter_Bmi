import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bmi/constants.dart';
import 'package:bmi/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI Calculater",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: AnimatedSplashScreen(
        backgroundColor: mainHexColor,
        splash: Image(image: AssetImage("Asset/bmi.png")),
        nextScreen: HomeScreen(),
        splashIconSize: 250,
      ),
    );
  }
}
