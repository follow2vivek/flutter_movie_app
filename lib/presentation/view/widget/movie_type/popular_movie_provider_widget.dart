import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/bloc/movie/movie_bloc.dart';
import 'package:movie_app/presentation/provider/movie/movie_provider.dart';
import 'package:movie_app/presentation/view/widget/movie/movie_widget.dart';

class PopularMovieProviderWidget extends StatelessWidget {
  const PopularMovieProviderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return ref.watch(popularMovieProvider).when(
              data: (data) => MovieWidget(
                heading: 'Popular',
                movieList: data.results ?? [],
              ),
              error: (error, stackTrace) => const Text('errir'),
              loading: () => const CircularProgressIndicator(),
            );
      },
    );
  }
}
