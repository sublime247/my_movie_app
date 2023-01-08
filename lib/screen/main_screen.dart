import 'package:flutter/material.dart';
import 'package:my_movie_app/services/auth_service.dart';
import 'package:my_movie_app/widgets/movies_result.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF840052),
        appBar: AppBar(
          backgroundColor: Color(0xFF840052),
          elevation: 0,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person),
              ),
            )
          ],
        ),
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 105, 35, 78),
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.cancel,
                      color: Colors.white,
                    ),
                  ],
                ),
                onTap: () {
                  // Navigate to item 1 page
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(
                height: 50,
              ),
              ListTile(
                title: const Text(
                  'Movies',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  // Navigate to item 1 page
                },
              ),
              SizedBox(
                height: 40,
              ),
              ListTile(
                title: Text('Horror', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Navigate to item 2 page
                },
              ),
              SizedBox(
                height: 40,
              ),
              ListTile(
                title: Text('Action', style: TextStyle(color: Colors.white)),
                onTap: () {
                  AuthService.firebase().signOut();
                  // Navigate to item 3 page
                },
              ),
              SizedBox(
                height: 50,
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Log Out', style: TextStyle(color: Colors.white)),
                  ],
                ),
                onTap: () {
                  AuthService.firebase().signOut();
                  // Navigate to item 3 page
                },
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                        hintText: 'Search movies, series',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        fillColor: Color.fromARGB(255, 75, 0, 46),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 75, 0, 46),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
             const MovieResult()
            ],
          ),
        ));
  }
}
