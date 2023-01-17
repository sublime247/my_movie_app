import 'package:flutter/material.dart';
import 'package:my_movie_app/apis/search_movies_api.dart';
import 'package:my_movie_app/widgets/future_builder.dart';

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
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const Padding(
          padding:  EdgeInsets.only(left:8.0),
          child:  Text('Trending Movies', style: TextStyle(color: Colors.white),),
        ),
        SizedBox(height: 8,),
        FutureBuilderWidget(
          searchMovies: SearchAll().trendingMovies,
          image: 'https://image.tmdb.org/t/p/original',
        ), 
        const  SizedBox(height: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        const   Padding(
             padding:  EdgeInsets.only(left:8.0),
             child:  Text('Top Rated',style: TextStyle(color: Colors.white),),
           ),
           const SizedBox(height: 8,),
            FutureBuilderWidget(
              searchMovies: SearchAll().topRated,
              image: 'https://image.tmdb.org/t/p/original',
            ),
          ],
        ),
        const  SizedBox(height: 20,),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [
        const    Padding(
             padding:  EdgeInsets.only(left:8.0),
             child:   Text('Avengers collections', style: TextStyle(color: Colors.white),),
           ),
          const SizedBox(height: 8,),
               FutureBuilderWidget(
          searchMovies: SearchAll().searchMovie,
          image: 'https://image.tmdb.org/t/p/original',
               ),
             ],
           )      
      
  ]  )) ;
  }
}
