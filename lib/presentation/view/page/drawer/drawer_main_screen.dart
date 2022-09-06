import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:movie_app/presentation/view/widget/movie_type/popular_movie_widget.dart';
import 'package:movie_app/presentation/view/widget/movie_type/top_rated_movie_widget.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../../../res/app_colors.dart';
import '../../../../res/app_styles.dart';

class DrawerMainScreen extends StatelessWidget {
  const DrawerMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
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
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                  image:
                      'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/c618cd88432989.5dd5e72e505d1.jpg',
                ),
              ),
              const PopularMovieWidget(),
              const SizedBox(height: 16),
              const TopRatedMovieWidget(),
              const SizedBox(height: 26),
            ],
          ),
        ],
      ),
    );
  }
}
