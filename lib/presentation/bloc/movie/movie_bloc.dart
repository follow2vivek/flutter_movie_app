import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/model/movie/movie_model.dart';
import 'package:movie_app/repository/movie/movie_repository.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;
  MovieBloc({required this.movieRepository}) : super(MovieInitial()) {
    on<PopularMovieEvent>(_popularMovie);
    on<TopRatedMovieEvent>(_topRatedMovie);
    on<RecommendedMovieEvent>(_recommendedMovie);
  }
  void _popularMovie(PopularMovieEvent event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    final result = await movieRepository.getPopularMovie();
    result.fold(
      (error) => emit(MovieError(error: error)),
      (data) => emit(
        MoviePopularLoaded(movieModel: data),
      ),
    );
  }

  void _topRatedMovie(
      TopRatedMovieEvent event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    final result = await movieRepository.getTopRatedMovie();
    result.fold(
      (error) => emit(MovieError(error: error)),
      (data) => emit(
        MovieTopRatedLoaded(movieModel: data),
      ),
    );
  }

  void _recommendedMovie(
      RecommendedMovieEvent event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    final result = await movieRepository.getRecomendedMovie(event.movieId);
    result.fold(
      (error) => emit(MovieError(error: error)),
      (data) => emit(
        MovieRecommendedLoaded(movieModel: data),
      ),
    );
  }
}
