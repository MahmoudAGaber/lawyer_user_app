import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';
import '../models/all_top_rated_lawyers_model.dart';

class AllTopRatedLawyersController extends GetxController {
  GetAllTopRatedLawyersModel getAllTopRatedLawyersModel =
      GetAllTopRatedLawyersModel();

  bool topRatedLawyersLoader = false;
  updateTopRatedLawyersLoader(bool newValue) {
    topRatedLawyersLoader = newValue;
    update();
  }

  int? selectedLawyerCategoryIndex = 0;
  updateSelectedLawyerCategoryIndex(int? newValue) {
    selectedLawyerCategoryIndex = newValue;
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
