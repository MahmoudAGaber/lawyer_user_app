import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';
import '../api_services/post_service.dart';
import '../models/all_lawyers_model.dart';
import '../repositories/lawyers_by_category_repo.dart';
import 'general_controller.dart';

class LawyersByCategoryController extends GetxController {
  GetAllLawyersModel getAllLawyersModel = GetAllLawyersModel();

  bool lawyersByCategoryLoader = false;
  updateLawyersByCategoryLoader(bool newValue) {
    lawyersByCategoryLoader = newValue;
    update();
  }

  String? selectedLawyerCategory;
  // LawyerModel selectedLawyerForView = LawyerModel();
  GetAllLawyersDataModel getAllLawyersDataModel = GetAllLawyersDataModel();

  List<LawyerModel> lawyerListForPagination = [];

  // updateSelectedLawyerForView(
  //   LawyerModel newValue,
  // ) {
  //   selectedLawyerForView = newValue;

  //   update();
  // }

  ///------------------------------- Lawyers-data-check
  bool getLawyersDataCheck = false;
  getLawyersDataCheckCheck(bool value) {
    getLawyersDataCheck = value;
    update();
  }

  int? selectedLawyerCategoryIndex = 0;
  updateSelectedLawyerCategoryIndex(int? newValue) {
    selectedLawyerCategoryIndex = newValue;
    update();
  }

  /// paginated-data-fetch
  Future paginationDataLoad(BuildContext context) async {
    // perform fetching data delay
    // await new Future.delayed(new Duration(seconds: 2));

    log("load more");
    // update data and loading status
    if (getAllLawyersModel.data!.meta!.lastPage! >
        getAllLawyersModel.data!.meta!.currentPage!) {
      Get.find<GeneralController>().changeGetPaginationProgressCheck(true);

      postMethod(
          context,
          '${getAllLawyersModel.data!.meta!.path}',
          {
            'page': (getAllLawyersModel.data!.meta!.currentPage! + 1),
            'perPage': getAllLawyersModel.data!.meta!.perPage
          },
          false,
          getLawyersByCategoryRepo);
      update();
    }
  }

  updateLawyerListForPagination(LawyerModel lawyerModel) {
    lawyerListForPagination.add(lawyerModel);
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
