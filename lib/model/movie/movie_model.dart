import 'package:intl/intl.dart';

class MovieModel {
  int? page;
  List<MovieResults>? results;
  int? totalPages;
  int? totalResults;

  MovieModel(
      {this.page, this.results, this.totalPages, this.totalResults});

  MovieModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <MovieResults>[];
      json['results'].forEach((v) {
        results!.add(MovieResults.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

class MovieResults {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  late String originalTitle;
  late String overview;
  double? popularity;
  String? posterPath;
  late String releaseDate;
  late String title;
  bool? video;
  late num voteAverage;
  int? voteCount;

  MovieResults(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle = '',
      this.overview = '',
      this.popularity,
      this.posterPath,
      this.releaseDate = '',
      this.title = '',
      this.video,
      this.voteAverage = 1,
      this.voteCount});

  MovieResults.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'] ?? '';
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = DateFormat.y().format(DateTime.parse(json['release_date']));
    title = json['title'] ?? '';
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
}
