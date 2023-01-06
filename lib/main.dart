import 'package:flutter/material.dart';
import 'package:my_movie_app/screen/home_screen.dart';
import 'package:my_movie_app/screen/login_screen.dart';
import 'package:my_movie_app/screen/main_screen.dart';
import 'package:my_movie_app/screen/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_movie_app/screen/verify.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home':(context) => const HomePage(),
       '/login':(context) => const LoginScreen(),
       '/register':(context) =>const  SignUpScreen(),
       '/verify-mail':(context)=>const  VerifyEmail(),
       '/main-home':(context) => const  MainHome(),
    } ,
  ));
}

