import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/bloc/movie/movie_bloc.dart';
import 'package:movie_app/presentation/view/widget/movie/movie_widget.dart';

class TopRatedMovieWidget extends StatefulWidget {
  const TopRatedMovieWidget({Key? key}) : super(key: key);

  @override
  State<TopRatedMovieWidget> createState() => _TopRatedMovieWidgetState();
}

class _TopRatedMovieWidgetState extends State<TopRatedMovieWidget> {
  @override
  void initState() {
    BlocProvider.of<MovieBloc>(context).add(TopRatedMovieEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: ((previous, current) => current is MovieTopRatedLoaded),
      builder: (context, state) {
        if (state is MovieLoading) {
          return const SizedBox();
        } else if (state is MovieTopRatedLoaded) {
          return MovieWidget(
            heading: 'Top Rated',
            movieList: state.movieModel.results ?? [],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
