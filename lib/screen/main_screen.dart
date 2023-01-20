import 'package:flutter/material.dart';
import 'package:my_movie_app/services/auth_service.dart';
import 'package:my_movie_app/widgets/movies_result.dart';
import 'package:my_movie_app/widgets/search_movie.dart';
import 'package:my_movie_app/widgets/top_rated.dart';
import 'package:my_movie_app/widgets/trending_movies.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  late final TextEditingController searchMovie;
  @override
  void initState() {
    searchMovie = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          // backgroundColor: Color.fromARGB(255, 105, 35, 78),
          elevation: 0,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey,
                child: Image.asset('assets/profile.png'),
              ),
            )
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.black54,
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
              const SizedBox(
                height: 50,
              ),
              ListTile(
                title: const Text(
                  'Movies',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  // Navigate to item 1 page
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(
                height: 40,
              ),
              ListTile(
                title:const Text('Trending', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Navigate to item 2 page
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const TrendingMovie()));
                },
              ),
            const  SizedBox(
                height: 40,
              ),
              ListTile(
                title:const Text('Top Rated', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const TopRatedMovie()));
                  // Navigate to item 3 page
                },
              ),
             const SizedBox(
                height: 50,
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text('Log Out', style: TextStyle(color: Colors.white)),
                  ],
                ),
                onTap: () {
                  AuthService.firebase().signOut();
                  Navigator.of(context).pushReplacementNamed('/login');
                  // Navigate to item 3 page
                },
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                      child: TextFormField(
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        controller: searchMovie,
                        onFieldSubmitted: (value) {
                          if (searchMovie.text.isNotEmpty) {
                            setState(() {
                              searchingMovie();
                            });
                          }
                         
                          if (searchMovie.text.isEmpty) {
                            return;
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.search, color: Colors.grey[400]),
                          hintText: 'Search movies, series',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          fillColor: Colors.transparent,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
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
                const SizedBox(
                  height: 40,
                ),
                const MovieResult()
              ],
            ),
          ),
        ));
  }

  searchingMovie() {
    if (searchMovie.text.isNotEmpty) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SearchMoviePage(
                search: searchMovie.text,
              )));
      
    }
  }

  @override
  void dispose() {
    searchMovie.dispose();
    super.dispose();
  }
}
