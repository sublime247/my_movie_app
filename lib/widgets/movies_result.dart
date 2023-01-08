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
    return FutureBuilder(
      future: searchMovies('batman'),
      builder: (context, snapshot){
        switch (snapshot.hasData) {
          case true:
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(snapshot.data[index].title),
                );
              },
            );
          default:
            return const Text('Loading...');
        }
      });
  }
}