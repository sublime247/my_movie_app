import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
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
 runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp()
        
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
       debugShowCheckedModeBanner: false,
      initialRoute: '/main-home',
      routes: {
        '/home':(context) => const HomePage(),
         '/login':(context) => const LoginScreen(),
         '/register':(context) =>const  SignUpScreen(),
         '/verify-mail':(context)=>const  VerifyEmail(),
         '/main-home':(context) => const  MainHome(),
      } ,
      );
  }
}