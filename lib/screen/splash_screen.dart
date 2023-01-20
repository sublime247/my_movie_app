
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, '/home');
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
           Container(
            decoration:  BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF840052).withOpacity(0.89),
                  // Color(0xFF840052).withOpacity(0.89),
                  // Color(0xFF840052),
                  Color(0xFF840052).withOpacity(1),
                   Color(0xFF840052).withOpacity(0.89),
                ],
              ),
            ),
          ),
        GridView.custom(
          gridDelegate: SliverWovenGridDelegate.count(
            crossAxisCount: 4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            pattern: const [
              WovenGridTile(1),
              WovenGridTile(
                5 / 7,
                crossAxisRatio: 0.9,
                alignment: AlignmentDirectional.centerEnd,
              ),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) => const Tile(),
          ),
        ),
       const Center(
          child: Text('My Movie App', style: TextStyle(color: Colors.white,fontSize: 40),),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 30.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              
              style: ElevatedButton.styleFrom(
                elevation: 0,
                fixedSize: Size(300, 50),
                backgroundColor: Color(0xFF840052),
                
              ),
              onPressed: () {},
              child: const Text(
                'Get Started',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: 0.04,
        child: Image.asset(
          "assets/movie-logo.png",
          width: 15,
        ));
  }
}
