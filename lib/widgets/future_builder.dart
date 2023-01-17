import 'package:flutter/material.dart';
import 'package:my_movie_app/screen/description_screen.dart';

class FutureBuilderWidget extends StatelessWidget {
  const FutureBuilderWidget(
      {super.key,
      this.searchMovies,
      this.image,
      this.overview,
      this.voteAverage,
      this.releaseDate,
      this.voteCount,
      this.popularity,
      this.title,});
  final Function? searchMovies;
  final String? image;
  final String? overview;
  final String? voteAverage;
  final String? releaseDate;
  final String? voteCount;
  final String? popularity; 
  final String? title;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: searchMovies!(),
      builder: ((context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Stack(children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DescriptionScreen(
                                  image:
                                      '$image${snapshot.data!.results[index].backdropPath}',
                                    overview: snapshot.data!.results[index].overview,
                                    voteAverage: '${snapshot.data!.results[index].voteAverage}',
                                    releaseDate: '${snapshot.data!.results[index].releaseDate}', 
                                    title: '${snapshot.data!.results[index].originalName ?? snapshot.data!.results[index].originalTitle}',
                                    voteCount: '${snapshot.data!.results[index].voteCount}',
                                    popularity: '${snapshot.data!.results[index].popularity}',
                                )));
                      },
                      child: Image.network(
                        '$image${snapshot.data!.results[index].posterPath}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Text(snapshot.data!.results[index].title),
                  ]),
                );
              },
            ),
          );
        } 
        else {
          return const Text('Loading...');
        }
      }),
    );
  }
}
