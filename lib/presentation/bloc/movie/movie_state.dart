part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MoviePopularLoaded extends MovieState {
  final MovieModel movieModel;

  const MoviePopularLoaded({required this.movieModel});
  @override
  List<Object> get props => [movieModel];
}
class MovieTopRatedLoaded extends MovieState {
  final MovieModel movieModel;

  const MovieTopRatedLoaded({required this.movieModel});
  @override
  List<Object> get props => [movieModel];
}
class MovieRecommendedLoaded extends MovieState {
  final MovieModel movieModel;

  const MovieRecommendedLoaded({required this.movieModel});
  @override
  List<Object> get props => [movieModel];
}

class MovieError extends MovieState {
  final String error;

  const MovieError({required this.error});
  
  @override
  List<Object> get props => [error];
}
