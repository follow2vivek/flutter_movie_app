part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class PopularMovieEvent extends MovieEvent {
  @override
  List<Object> get props => [];
}

class TopRatedMovieEvent extends MovieEvent {
  @override
  List<Object> get props => [];
}

class RecommendedMovieEvent extends MovieEvent {
  final int movieId;

  const RecommendedMovieEvent({required this.movieId});
  @override
  List<Object> get props => [movieId];
}
