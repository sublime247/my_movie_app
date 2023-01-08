import 'dart:convert';

import 'package:my_movie_app/model/movie_collection.dart';
import 'package:http/http.dart' as http;

Future searchMovie(String search) async {
  try {
    String apiKey = '8fd9f7da67f9c8edcf2637b4d564d199';
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$search'));
    final movieCollection = jsonDecode(response.body);
    return MovieModel.fromJson(movieCollection);
  } catch (e) {
    print(e);
  }
}
