import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:movie_app/presentation/view/page/drawer/drawer_main_screen.dart';
import 'package:movie_app/presentation/view/page/drawer/drawer_menu_screen.dart';
import 'package:movie_app/res/app_colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      androidCloseOnBackTap: true,
      mainScreenTapClose: true,
      menuScreenTapClose: true,
      menuBackgroundColor: AppColors.black,
      mainScreen: const DrawerMainScreen(),
      menuScreen: DrawerMenuScreen(),
    );
  }
}
