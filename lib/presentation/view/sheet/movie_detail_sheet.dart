import 'package:flutter/material.dart';
import 'package:movie_app/model/movie/movie_model.dart';
import 'package:movie_app/presentation/view/page/movie/movie_detail_screen.dart';
import 'package:movie_app/presentation/view/widget/movie/see_more_movie_widget.dart';
import 'package:movie_app/res/app_colors.dart';
import 'package:movie_app/res/app_styles.dart';

class MovieDetailSheet extends StatelessWidget {
  final MovieResults movie;
  const MovieDetailSheet({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: const BorderRadius.horizontal(
          left: Radius.circular(10),
          right: Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SeeMoreMovieWidget(
              movieResults: movie,
              maxLine: 4,
              widgetHeight: size.height * .25,
              bannerHeight: size.height * .23,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Divider(
              color: AppColors.white,
              height: 2,
            ),
          ),
          InkWell(
            onTap: () => _navigateToMovieDetail(context),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: AppColors.white),
                  const SizedBox(width: 10),
                  Text(
                    'Detail & More',
                    style: AppStyles.defaultTextStyle.copyWith(
                      color: AppColors.white,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.chevron_right, color: AppColors.white, size: 28),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  void _navigateToMovieDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MovieDetailScreen(movie: movie),
      ),
    );
  }
}
