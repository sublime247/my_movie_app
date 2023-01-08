class Movie {
  final String title;
  final String posterPath;
  final String overview;
  final String releaseDate;
  final String voteAverage;

  Movie(
      {required this.title,
      required this.posterPath,
      required this.overview,
      required this.releaseDate,
      required this.voteAverage});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json['title'],
        posterPath: json['poster_path'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        voteAverage: json['vote_average'].toString());
  }
}



//Collections of movies :series,action, comedy, horror
//https://api.themoviedb.org/3/search/collection?api_key=8fd9f7da67f9c8edcf2637b4d564d199&language=en-US&query=series&page=1

//multiple search using the search function

//https://api.themoviedb.org/3/search/multi?api_key=8fd9f7da67f9c8edcf2637b4d564d199&language=en-US&query= omo ghetto&page=1&include_adult=false

//top rated movies
//https://api.themoviedb.org/3/movie/top_rated?api_key=8fd9f7da67f9c8edcf2637b4d564d199&language=en-US&page=1