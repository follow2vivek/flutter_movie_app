import 'package:flutter/material.dart';
import 'package:movie_app/model/movie/movie_model.dart';
import 'package:movie_app/presentation/view/widget/movie/see_more_movie_widget.dart';
import 'package:movie_app/res/app_colors.dart';

class SeeMoreMovieScreen extends StatelessWidget {
  final String title;
  final List<MovieResults> movieList;
  const SeeMoreMovieScreen({
    Key? key,
    required this.title,
    required this.movieList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          title,
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
        child: ListView.separated(
          itemCount: movieList.length,
          itemBuilder: (context, index) => SeeMoreMovieWidget(
            movieResults: movieList[index],
          ),
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 10),
        ),
      ),
    );
  }
}
