import 'package:flutter/material.dart';
import 'package:movie_app/res/app_colors.dart';
import 'package:movie_app/res/app_styles.dart';

class MenuItemWidget extends StatelessWidget {
  final bool isSelected;
  final IconData iconData;
  final String title;
  const MenuItemWidget({
    Key? key,
    this.isSelected = false,
    required this.iconData,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
      decoration: isSelected
          ? BoxDecoration(
              color: AppColors.red,
              borderRadius: BorderRadius.circular(10),
            )
          : null,
      child: Row(
        children: [
          Icon(
            iconData,
            color: AppColors.white,
          ),
          SizedBox(width: size.width * .08),
          Text(
            title,
            style: AppStyles.defaultTextStyle.copyWith(
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
