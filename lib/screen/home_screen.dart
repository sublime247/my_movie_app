import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_app/firebase_options.dart';
import 'package:my_movie_app/screen/login_screen.dart';
import 'package:my_movie_app/screen/main_screen.dart';
import 'package:my_movie_app/screen/signup_screen.dart';
import 'package:my_movie_app/screen/verify.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if(user != null){
              if(user.emailVerified){
                return const MainHome();
              }else{
                return const VerifyEmail();
              }
            }
              return const LoginScreen();

          default:
            return const Text('Loading...');
        }
      },
    ));
  }
}
