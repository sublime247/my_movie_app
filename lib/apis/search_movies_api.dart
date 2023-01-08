import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:my_movie_app/model/movie_collection.dart';

Future<Movie> searchMovies(String search) async {
  final Dio dio = Dio();
  final reponse = await dio.get(
      'https://api.themoviedb.org/3/search/multi?api_key=8fd9f7da67f9c8edcf2637b4d564d199&language=en-US&query=$search&page=1&include_adult=false');

  final responseModel = jsonDecode(reponse.data);
  log(responseModel);
  return Movie.fromJson(responseModel);
  
  // print(responseModel);
}
