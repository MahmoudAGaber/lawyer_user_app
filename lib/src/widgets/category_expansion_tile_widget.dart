import 'package:flutter/material.dart';
import 'package:resize/resize.dart';

import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';

class CategoryExpansionTileWidget extends StatelessWidget {
  final String categoryTitle, categoryIcon;
  final Widget subCategoryTile;
  const CategoryExpansionTileWidget({
    super.key,
    required this.categoryTitle,
    required this.categoryIcon,
    required this.subCategoryTile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(18, 0, 18, 18),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: AppColors.gradientOne),
      child: Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: AppColors.white,
        ),
        child: ExpansionTile(
          leading: ImageIcon(
            NetworkImage(mediaUrl + categoryIcon),
            size: 30.w,
            color: AppColors.white,
          ),
          iconColor: AppColors.white,
          // shape: RoundedRectangleBorder(
          //     side: BorderSide.none, borderRadius: BorderRadius.circular(10)),
          title: Text(
            categoryTitle,
            style: AppTextStyles.bodyTextStyle5,
          ),
          children: <Widget>[subCategoryTile],
        ),
      ),
    );
  }
}
