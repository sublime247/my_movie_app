class MovieModel {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  MovieModel(this.page, this.results, this.totalPages, this.totalResults);

  MovieModel.fromJson(Map<String, dynamic> json) {
        page = json['page'];
    if (json['results'] != null) {
      results = List<Results>.empty(growable: true);
      json['results'].forEach((e) {
        results!.add(Results.fromJson(e));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

class Results {
  String? backdropPath;
  String? firstAirDate;
  List<int>? genreIds;
  int? id;
  String? mediaType;
  String? name;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  double? voteAverage;
  int? voteCount;
  bool? adult;
  String? originalTitle;
  String? releaseDate;
  String? title;
  bool? video;
  int? gender;
  String? knownForDepartment;
  String? profilePath;

  Results(
      {this.backdropPath,
      this.firstAirDate,
      this.genreIds,
      this.id,
      this.mediaType,
      this.name,
      this.originCountry,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.popularity,
      this.posterPath,
      this.voteAverage,
      this.voteCount,
      this.adult,
      this.originalTitle,
      this.releaseDate,
      this.title,
      this.video,
      this.gender,
     
      this.knownForDepartment,
      this.profilePath});

  Results.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    firstAirDate = json['first_air_date'];
    if(genreIds != null){
      genreIds = List<int>.empty(growable: true);
      json['genre_ids'].forEach((e) {
        genreIds!.add(e);
      });
    }
    id = json['id'];
    mediaType = json['media_type'];
    name = json['name'];
    originCountry = json['origin_country'];
    originalLanguage = json['original_language'];
    originalName = json['original_name'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    adult = json['adult'];
    originalTitle = json['original_title'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    gender = json['gender'];
    knownForDepartment = json['known_for_department'];
    profilePath = json['profile_path'];
  }
}
