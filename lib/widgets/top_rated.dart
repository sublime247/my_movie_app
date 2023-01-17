import 'package:flutter/material.dart';
import 'package:my_movie_app/apis/search_movies_api.dart';
import 'package:my_movie_app/screen/description_screen.dart';

class TopRatedMovie extends StatelessWidget {
  const TopRatedMovie(
      {super.key,
     
      this.image,
      this.overview,
      this.voteAverage,
      this.releaseDate,
      this.voteCount,
      this.popularity,
      this.title,});
  final String? image;
  final String? overview;
  final String? voteAverage;
  final String? releaseDate;
  final String? voteCount;
  final String? popularity; 
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: FutureBuilder(
          future: SearchAll().topRated(),
          builder: ((context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: snapshot.data!.results.length,
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10
                  
                ),
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return DescriptionScreen(
                          image:
                              'https://image.tmdb.org/t/p/original${snapshot.data!.results[index].backdropPath}',
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
                      'https://image.tmdb.org/t/p/original${snapshot.data!.results[index].posterPath}',
                      fit: BoxFit.cover,
                    )),
                  );
                }));
            } 
            else {
              return const Text('Loading...');
            }
          }),
        ),
      ),
    );
  }
}
