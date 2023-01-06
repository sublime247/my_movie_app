import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_app/authentication/authentication.dart';
import 'package:my_movie_app/screen/login_screen.dart';
import 'package:my_movie_app/screen/signup_screen.dart';
import 'package:my_movie_app/screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

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
            final currentUser = FirebaseAuth.instance.currentUser;
            if (currentUser!.emailVerified) {
              print('User is logged in');
            } else {
              print('you need to verify your email');
            }
             return Text('done...');

          default:
            return Text('Loading...');
        }
      },
    ));
  }
}
