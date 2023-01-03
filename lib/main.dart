 import 'package:flutter/material.dart';
import 'package:my_movie_app/screen/splash_screen.dart';
 void main(List<String> args) {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashScreen(),
    );
  }
}