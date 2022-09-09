import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/model/movie/movie_model.dart';
import 'package:movie_app/network/app_urls.dart';
import 'package:movie_app/presentation/bloc/movie/movie_bloc.dart';
import 'package:movie_app/presentation/provider/movie/movie_provider.dart';
import 'package:movie_app/presentation/view/widget/image_tile_widget.dart';
import 'package:movie_app/res/app_colors.dart';
import 'package:movie_app/res/app_styles.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieDetailScreen extends StatelessWidget {
  final MovieResults movie;
  const MovieDetailScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: '${AppUrls.imageUrl}${movie.posterPath}',
              fit: BoxFit.cover,
              height: size.height * .25,
              width: size.width,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: AppStyles.defaultTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.black100,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            movie.releaseDate,
                            style: AppStyles.defaultTextStyle.copyWith(
                              color: AppColors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        movie.voteAverage.toString(),
                        style: AppStyles.defaultTextStyle.copyWith(
                          color: AppColors.white,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        '1h 50m',
                        style: AppStyles.defaultTextStyle.copyWith(
                          color: Colors.white54,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: size.width,
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.black100,
                    ),
                    child: Center(
                      child: Text(
                        'Add to watchlist',
                        style: AppStyles.defaultTextStyle.copyWith(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    movie.overview,
                    style: AppStyles.defaultTextStyle.copyWith(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 36),
                  Text(
                    'MORE LIKE THIS',
                    style: AppStyles.defaultTextStyle.copyWith(
                      color: Colors.white54,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //const SizedBox(height: 16),
                ],
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                ref.listen(recommendedMovie(movie.id ?? 0), (previous, next) {
                  if (next is AsyncData) {
                    ref.read(popularMovieStateProvider.notifier).getMovie();
                  }
                });
                return ref.watch(recommendedMovie(movie.id ?? 0)).when(
                    data: (data) => GridView.count(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          shrinkWrap: true,
                          childAspectRatio: 3 / 4,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          physics: const NeverScrollableScrollPhysics(),
                          children: data.results!
                              .map(
                                (movie) => ImageTileWidget(
                                  imageHeight: size.height * .22,
                                  imageUrl:
                                      '${AppUrls.imageUrl}${movie.posterPath}',
                                ),
                              )
                              .toList(),
                        ),
                    error: (e, st) => const SizedBox(),
                    loading: () => const CircularProgressIndicator());
              },
            )
          ],
        ),
      ),
    );
  }
}
