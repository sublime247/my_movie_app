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
      future: searchMovie('batman'),
    builder: ((context, AsyncSnapshot snapshot) {
      if (snapshot.hasData) {
        return Container(
             height: 200,
             width: 300,
          child: ListView.builder(
            itemCount: snapshot.data!.results.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data!.results[index].title),
              );
            },
          ),
        );
      } else {
        return const Text('Loading...');
      }
    }),
    );
    }
     
      
        
  }
