import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_app/model/movie/movie_model.dart';
import 'package:movie_app/network/app_urls.dart';
import 'package:movie_app/network/network.dart';
import 'package:movie_app/usecases/movie/recommended_movie_usecase.dart';

final popularMovieProvider =
    FutureProvider.autoDispose<MovieModel>((ref) async {
  final apiProvider = ref.watch(networkProvider);
  final result = await apiProvider.get(AppUrls.popularMovie);
  return MovieModel.fromJson(json.decode(result.body));
});

final recommendedMovie =
    FutureProvider.autoDispose.family<MovieModel, int>((ref, id) async {
  final recommendedUseCase = ref.watch(recommendedMovieProvider);
  final result = await recommendedUseCase.getRecommendedMovie(id);
  return result.fold((error) => throw Exception(), (data) => data);
});

final popularMovieStateProvider =
    StateNotifierProvider<PopularMovie, AsyncValue<MovieModel>>((ref) {
  return PopularMovie(ref);
});

class PopularMovie extends StateNotifier<AsyncValue<MovieModel>> {
  Ref ref;
  PopularMovie(this.ref):super(const AsyncLoading());

  void getMovie() async {
      log('popularMovieProvider');

    state = const AsyncLoading();
    final apiProvider = ref.watch(networkProvider);

    final result = await apiProvider.get(AppUrls.popularMovie);
    state = AsyncData(MovieModel.fromJson(json.decode(result.body)));
  }
}
