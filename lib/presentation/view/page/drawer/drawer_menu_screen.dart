import 'package:flutter/material.dart';
import 'package:movie_app/model/drawer/drawer_menu_model.dart';
import 'package:movie_app/presentation/view/widget/menu_item_widget.dart';
import 'package:movie_app/res/app_colors.dart';

class DrawerMenuScreen extends StatelessWidget {
  DrawerMenuScreen({Key? key}) : super(key: key);

  final drawerMenuList = <DrawerMenuModel>[
    DrawerMenuModel(iconData: Icons.movie, title: 'Movies'),
    DrawerMenuModel(iconData: Icons.tv, title: 'Tv Shows'),
    DrawerMenuModel(iconData: Icons.download_outlined, title: 'Watchlist'),
    DrawerMenuModel(iconData: Icons.info_outline, title: 'About'),
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * .20,
          ),
          Container(
            width: size.width * .10,
            height: size.height * .10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
            ),
            child: Center(
              child: Icon(
                Icons.close,
                color: AppColors.black,
              ),
            ),
          ),
          SizedBox(
            height: size.height * .10,
          ),
          Column(
            children: drawerMenuList
                .map(
                  (item) => MenuItemWidget(
                    iconData: item.iconData,
                    title: item.title,
                    isSelected: item.title == 'Movies' ? true : false,
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
