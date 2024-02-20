import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';

import '../models/all_lawyer_categories_model.dart';

class AllLawyersCategoriesController extends GetxController {
  GetAllLawyerCategoriesModel getAllLawyerCategoriesModel =
      GetAllLawyerCategoriesModel();
  // GetAllLawyerCategoriesDataModel getAllLawyerCategoriesDataModel =
  //     GetAllLawyerCategoriesDataModel();

  bool lawyerCategoriesLoader = false;
  updatelawyerCategoriesLoader(bool newValue) {
    lawyerCategoriesLoader = newValue;
    update();
  }

  // String? selectedBlogCategory;
  // BlogModel selectedBlogForView = BlogModel();
  // updateSelectedBlogForView(BlogModel newValue, String? newSelectedBlogCategory) {
  //   selectedBlogForView = newValue;
  //   selectedBlogCategory = newSelectedBlogCategory;
  //   update();
  // }

  int? selectedBlogCategoryIndex = 0;
  updateSelectedBlogCategoryIndex(int? newValue) {
    selectedBlogCategoryIndex = newValue;
    update();
  }

  ///----app-bar-settings-----start
  ScrollController? scrollController;
  bool lastStatus = true;
  double height = 100.h;

  bool get isShrink {
    return scrollController!.hasClients &&
        scrollController!.offset > (height - kToolbarHeight);
  }

  void scrollListener() {
    if (isShrink != lastStatus) {
      lastStatus = isShrink;
      update();
    }
  }
}
