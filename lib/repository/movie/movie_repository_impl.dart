import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/model/movie/movie_model.dart';
import 'package:fpdart/src/either.dart';
import 'package:movie_app/repository/movie/movie_repository.dart';
import 'package:movie_app/usecases/movie/popular_movie_usecase.dart';
import 'package:movie_app/usecases/movie/recommended_movie_usecase.dart';
import 'package:movie_app/usecases/movie/top_rated_movie_usecase.dart';


class MovieRepositoryImpl implements MovieRepository {
  final PopularMovieUsecase popularMovieUsecase;
  final TopRatedMovieUsecase topRatedMovieUsecase;
  final RecommendedMovieUsecase recommendedMovieUsecase;

  MovieRepositoryImpl({
    required this.popularMovieUsecase,
    required this.topRatedMovieUsecase,
    required this.recommendedMovieUsecase,
  });

  @override
  Future<Either<String, MovieModel>> getPopularMovie() async {
    return await popularMovieUsecase.popularMovie();
  }

  @override
  Future<Either<String, MovieModel>> getTopRatedMovie() async {
    return await topRatedMovieUsecase.topRatedMovie();
  }

  @override
  Future<Either<String, MovieModel>> getRecomendedMovie(int movieId) async {
    return await recommendedMovieUsecase.getRecommendedMovie(movieId);
  }
}
