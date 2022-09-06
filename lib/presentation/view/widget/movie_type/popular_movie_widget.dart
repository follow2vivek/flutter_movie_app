import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/bloc/movie/movie_bloc.dart';
import 'package:movie_app/presentation/view/widget/movie/movie_widget.dart';

class PopularMovieWidget extends StatefulWidget {
  const PopularMovieWidget({Key? key}) : super(key: key);

  @override
  State<PopularMovieWidget> createState() => _PopularMovieWidgetState();
}

class _PopularMovieWidgetState extends State<PopularMovieWidget> {
  @override
  void initState() {
    BlocProvider.of<MovieBloc>(context).add(PopularMovieEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: ((previous, current) => current is MoviePopularLoaded),
      builder: (context, state) {
        if (state is MovieLoading) {
          return const SizedBox();
        } else if (state is MoviePopularLoaded) {
          return MovieWidget(
            heading: 'Popular',
            movieList: state.movieModel.results ?? [],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
