import 'package:flutter/material.dart';
import 'package:movie_app/model/movie/movie_model.dart';
import 'package:movie_app/network/app_urls.dart';
import 'package:movie_app/res/app_colors.dart';
import 'package:movie_app/res/app_styles.dart';
import 'package:transparent_image/transparent_image.dart';

class SeeMoreMovieWidget extends StatelessWidget {
  final MovieResults movieResults;
  final int maxLine;
  final num? bannerHeight;
  final num? widgetHeight;
  const SeeMoreMovieWidget(
      {Key? key,
      required this.movieResults,
      this.maxLine = 2,
      this.bannerHeight,
      this.widgetHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: widgetHeight?.toDouble() ?? size.height * .20,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.black100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: '${AppUrls.imageUrl}${movieResults.posterPath}',
              fit: BoxFit.fill,
              height: bannerHeight?.toDouble() ?? size.height * .18,
              width: size.width / 3,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    movieResults.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.defaultTextStyle.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            movieResults.releaseDate,
                            style: AppStyles.defaultTextStyle.copyWith(
                              color: AppColors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        movieResults.voteAverage.toString(),
                        style: AppStyles.defaultTextStyle
                            .copyWith(color: AppColors.white, fontSize: 16),
                      )
                    ],
                  ),
                  const Spacer(),
                  Text(
                    movieResults.overview,
                    maxLines: maxLine,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.defaultTextStyle.copyWith(
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
