import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_movie_app/model/input_search_model.dart';

class SearchMoviePage extends StatefulWidget {
  const SearchMoviePage({super.key, this.search});
  final String? search;

  @override
  State<SearchMoviePage> createState() => _SearchMoviePageState();
}

Future _searchMovie(String search) async {
  try {
    String apiKey = '8fd9f7da67f9c8edcf2637b4d564d199';
    // final Dio dio = Dio();
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&language=en-US&query=$search&page=1&include_adult=false'));
    final movieCollection = jsonDecode(response.body);

    return MovieModel.fromJson(movieCollection);
  } catch (e) {
    log(e.toString());
  }
}

class _SearchMoviePageState extends State<SearchMoviePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: FutureBuilder(
        future: _searchMovie('${widget.search}'),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                itemCount: snapshot.data!.results.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                ),
                itemBuilder: ((context, index) {
                  return SizedBox(
                      child: Image.network(
                    'https://image.tmdb.org/t/p/w500${snapshot.data!.results[index].posterPath}',
                    fit: BoxFit.cover,
                  ));
                }));
          } else if (snapshot.data!.results.length == 0) {
            return const Center(
              child: Text('No data found'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
