import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_movie_app/model/input_search_model.dart';
import 'package:my_movie_app/screen/description_screen.dart';

class SearchMoviePage extends StatefulWidget {
  const SearchMoviePage(
      {super.key,
      this.search,
      this.image,
      this.overview,
      this.voteAverage,
      this.releaseDate,
      this.voteCount,
      this.popularity,
      this.title});
  final String? search;
  final String? image;
  final String? overview;
  final String? voteAverage;
  final String? releaseDate;
  final String? voteCount;
  final String? popularity;
  final String? title;

  @override
  State<SearchMoviePage> createState() => _SearchMoviePageState();
}

Future _searchMovie(String search) async {
  try {
    String apiKey = '8fd9f7da67f9c8edcf2637b4d564d199';
    // final Dio dio = Dio();
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/search/multi?api_key=$apiKey&language=en-US&query=$search&page=1&include_adult=false'));
    final movieCollection = jsonDecode(response.body);

    return MovieModel.fromJson(movieCollection);
  } catch (e) {
    log(e.toString());
  }
  return null;
}

class _SearchMoviePageState extends State<SearchMoviePage> {
  final String image = 'https://image.tmdb.org/t/p/original';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: FutureBuilder(
        future: _searchMovie('${widget.search}'),
        builder: ((context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                itemCount: snapshot.data!.results.length,
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  // mainAxisExtent:
                ),
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return DescriptionScreen(
                          image:
                              '$image${snapshot.data!.results[index].backdropPath}',
                          overview: snapshot.data!.results[index].overview,
                          voteAverage:
                              '${snapshot.data!.results[index].voteAverage}',
                          releaseDate:
                              '${snapshot.data!.results[index].releaseDate}',
                          title:
                              '${snapshot.data!.results[index].originalName ?? snapshot.data!.results[index].originalTitle ?? snapshot.data!.results[index].originalName}',
                          voteCount:
                              '${snapshot.data!.results[index].voteCount}',
                          popularity:
                              '${snapshot.data!.results[index].popularity}',
                        );
                      }));
                    },
                    child: SizedBox(
                        child: Image.network(
                      '$image${snapshot.data!.results[index].posterPath}',
                      fit: BoxFit.cover,
                    )),
                  );
                }));
          } else if (snapshot.data!.results.indexWhere((element) =>
                  element.posterPath == null) ==
              -1) {
            return const Center(
              child: Text('No data found'),
            );
          }else if(snapshot.hasData.toString() == '[]'){
            return const Center(
              child: Text('No data found'),
            );
          }
           else {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white,),
            );
          }
        }),
      ),
    );
  }
}
