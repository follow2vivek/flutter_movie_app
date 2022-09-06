import 'package:movie_app/utils/constants.dart';

abstract class AppUrls {
  static String baseUrl = 'https://api.themoviedb.org/3/';
  static String imageUrl = 'https://image.tmdb.org/t/p/original';
  static String popularMovie =
      'https://api.themoviedb.org/3/movie/popular?api_key=${Constants.api_key_auth_v3}';
  static String topRatedMovie =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.api_key_auth_v3}';
  static String recommendedMovie =
      'https://api.themoviedb.org/3/movie/#/recommendations?api_key=${Constants.api_key_auth_v3}';
}
