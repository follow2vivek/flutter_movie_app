import 'package:fpdart/fpdart.dart';
import 'package:movie_app/model/movie/movie_model.dart';

abstract class MovieRepository{
  Future<Either<String,MovieModel>> getPopularMovie();
  Future<Either<String,MovieModel>> getTopRatedMovie();
  Future<Either<String,MovieModel>> getRecomendedMovie(int movieId);
}