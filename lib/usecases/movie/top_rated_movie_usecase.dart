import 'dart:convert';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:movie_app/model/movie/movie_model.dart';
import 'package:movie_app/network/app_urls.dart';
import 'package:movie_app/network/network.dart';

class TopRatedMovieUsecase {
  final Network network;

  TopRatedMovieUsecase({required this.network});

  Future<Either<String, MovieModel>> topRatedMovie() async {
    try {
      final response = await network.get(AppUrls.topRatedMovie);
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
