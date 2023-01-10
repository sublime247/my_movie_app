class Autogenerated {
  late int page;
  late List<CollectionResults> results;
  late int totalPages;
  late int totalResults;

  Autogenerated(this.page, this.results, this.totalPages, this.totalResults);

  Autogenerated.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = List<CollectionResults>.empty(growable: true);
      json['results'].forEach((v) {
        results.add(CollectionResults.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

class CollectionResults {
  late bool adult;
   String? backdropPath;
  late int id;
  late String name;
  late String originalLanguage;
  late String originalName;
  late String overview;
  String? posterPath;

  CollectionResults(this.adult, this.backdropPath , this.id, this.name,
      this.originalLanguage, this.originalName, this.overview, this.posterPath);

  CollectionResults.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    if (backdropPath != null) {
      backdropPath = json['backdrop_path'] as String?;
    } else {
      backdropPath = ' ';
    }
    id = json['id'];
    name = json['name'];
    originalLanguage = json['original_language'];
    originalName = json['original_name'];
    overview = json['overview'];
  if(posterPath==null){
    posterPath = ' ';
  }else{
   posterPath = json['poster_path'];
  }
    // posterPath = json['poster_path'];
  }
}
