import 'package:flutter/material.dart';
import 'package:my_movie_app/authentication/authentication.dart';
import 'package:my_movie_app/screen/login_screen.dart';
import 'package:my_movie_app/screen/signup_screen.dart';
import 'package:my_movie_app/screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SignUpScreen(
        auth: Auth(),
      ),
    );
  }
}
