import 'package:get_it/get_it.dart';
import 'package:movie_app/network/network.dart';
import 'package:movie_app/presentation/bloc/movie/movie_bloc.dart';
import 'package:movie_app/repository/movie/movie_repository.dart';
import 'package:movie_app/repository/movie/movie_repository_impl.dart';
import 'package:movie_app/usecases/movie/popular_movie_usecase.dart';
import 'package:movie_app/usecases/movie/recommended_movie_usecase.dart';
import 'package:movie_app/usecases/movie/top_rated_movie_usecase.dart';

final GetIt locator = GetIt.instance;

void init() {
  //Bloc
  locator.registerFactory(() => MovieBloc(movieRepository: locator()));

  //Repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      popularMovieUsecase: locator(),
      topRatedMovieUsecase: locator(),
      recommendedMovieUsecase: locator()
    ),
  );

  //Usecase
  locator.registerLazySingleton(() => PopularMovieUsecase(network: locator()));
  locator.registerLazySingleton(() => TopRatedMovieUsecase(network: locator()));
  locator.registerLazySingleton(() => RecommendedMovieUsecase(network: locator()));

  //Network
  locator.registerLazySingleton(() => Network());
}
