import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:movie_app/model/movie/movie_model.dart';
import 'package:movie_app/network/app_urls.dart';
import 'package:movie_app/network/network.dart';

class RecommendedMovieUsecase{
  final Network network;

  RecommendedMovieUsecase({required this.network});

  Future<Either<String, MovieModel>> getRecommendedMovie(int movieId) async {
    try {
      final response = await network.get(AppUrls.topRatedMovie.replaceFirst('#',movieId.toString()));
      if (response.statusCode == 200) {
        return right(MovieModel.fromJson(json.decode(response.body)));
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }
}