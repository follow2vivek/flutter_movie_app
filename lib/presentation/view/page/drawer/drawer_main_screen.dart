import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:movie_app/network/app_urls.dart';
import 'package:movie_app/presentation/provider/movie/movie_provider.dart';
import 'package:movie_app/presentation/view/widget/movie_type/popular_movie_provider_widget.dart';
import 'package:movie_app/presentation/view/widget/movie_type/popular_movie_widget.dart';
import 'package:movie_app/presentation/view/widget/movie_type/top_rated_movie_widget.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../../../res/app_colors.dart';
import '../../../../res/app_styles.dart';

class DrawerMainScreen extends ConsumerWidget {
  const DrawerMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieProvider = ref.watch(popularMovieStateProvider);

    final size = MediaQuery.of(context).size;
    log('build');
    return Scaffold(
      backgroundColor: AppColors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'MDB',
          style: AppStyles.defaultTextStyle.copyWith(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(popularMovieStateProvider.notifier).getMovie();
            },
            icon: const Icon(Icons.search),
          ),
        ],
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              ZoomDrawer.of(context)!.toggle();
            },
            icon: const Icon(Icons.menu),
          );
        }),
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: size.height * .7,
                foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    AppColors.black.withOpacity(.6),
                    AppColors.black.withOpacity(.3),
                    AppColors.black,
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
                child: movieProvider.when(
                  data: (data) => FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                    image: '${AppUrls.imageUrl}${data.results![0].posterPath}',
                  ),
                  error: (e, st) => const SizedBox(),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              /* const PopularMovieWidget(),
              const SizedBox(height: 16),
              const TopRatedMovieWidget(),
              const SizedBox(height: 26), */
              const PopularMovieProviderWidget(),
              const SizedBox(height: 26),
            ],
          ),
        ],
      ),
    );
  }
}
