import 'package:flutter/material.dart';
import 'package:movie_app/model/movie/movie_model.dart';
import 'package:movie_app/network/app_urls.dart';
import 'package:movie_app/presentation/view/page/movie/see_more_movie_screen.dart';
import 'package:movie_app/presentation/view/sheet/movie_detail_sheet.dart';
import 'package:movie_app/presentation/view/widget/image_tile_widget.dart';
import 'package:movie_app/res/app_colors.dart';
import 'package:movie_app/res/app_styles.dart';

class MovieWidget extends StatelessWidget {
  final String heading;
  final List<MovieResults> movieList;
  const MovieWidget({Key? key, required this.heading, required this.movieList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => _moveToDetailPage(context),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  heading,
                  style: AppStyles.defaultTextStyle.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Text(
                  'See More',
                  style: AppStyles.defaultTextStyle.copyWith(
                    color: AppColors.white,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.white,
                  size: 14,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: size.height * .18,
          child: ListView.separated(
            padding: const EdgeInsets.only(left: 10),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => InkWell(
              onTap: () => _openMovieDetail(context, movieList[index]),
              child: ImageTileWidget(
                imageUrl: '${AppUrls.imageUrl}${movieList[index].posterPath}',
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: movieList.length,
          ),
        ),
      ],
    );
  }

  void _openMovieDetail(BuildContext context, MovieResults movie) {
    showModalBottomSheet(

      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => MovieDetailSheet(movie: movie),
    );
  }

  void _moveToDetailPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SeeMoreMovieScreen(
          title: heading,
          movieList: movieList,
        ),
      ),
    );
  }
}
