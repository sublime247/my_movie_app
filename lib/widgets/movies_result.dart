import 'package:flutter/material.dart';
import 'package:my_movie_app/apis/search_movies_api.dart';

class MovieResult extends StatefulWidget {
  const MovieResult({super.key});

  @override
  State<MovieResult> createState() => _MovieResultState();
}

class _MovieResultState extends State<MovieResult> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FutureBuilder(
            future: SearchAll().topRated(),
            builder: ((context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left:8.0, right: 8.0),
                        child: Stack(
                          children: [
                          Image.network(
                            'https://image.tmdb.org/t/p/original${snapshot.data!.results[index].posterPath}',
                            fit: BoxFit.cover,),
                          // Text(snapshot.data!.results[index].title),
                        ]),
                      );
                    },
                  ),
                );
              } else {
                return const Text('Loading...');
              }
            }),
          ),
        const  SizedBox(height: 10,),
            FutureBuilder(
            future: SearchAll().trendingMovies(),
            builder: ((context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left:8.0, right: 8.0),
                        child: Stack(
                          children: [
                          Image.network(
                            'https://image.tmdb.org/t/p/original${snapshot.data!.results[index].posterPath}',
                            fit: BoxFit.cover,),
                          // Text(snapshot.data!.results[index].title),
                        ]),
                      );
                    },
                  ),
                );
              } else {
                return const Text('Loading...');
              }
            }),
          ),
        
                  FutureBuilder(
                            future: SearchAll().searchMovie('Avengers'),
                            builder: ((context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left:8.0, right: 8.0),
                        child: Stack(
                          children: [
                          Image.network(
                            'https://image.tmdb.org/t/p/original${snapshot.data!.results[index].posterPath}',
                            fit: BoxFit.cover,),
                          // Text(snapshot.data!.results[index].title),
                        ]),
                      );
                    },
                  ),
                                );
                              } else {
                                return const Text('Loading...');
                              }
                            }),
                          ),
        ],
      ),
    );
  }
}
