import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';
import '../api_services/post_service.dart';
import '../models/lawyer_reviews_model.dart';
import '../repositories/lawyer_reviews_repo.dart';
import 'general_controller.dart';

class LawyerReviewsController extends GetxController {
  GetLawyerReviewsModel getLawyerReviewsModel = GetLawyerReviewsModel();

  bool allLawyerReviewsLoader = false;
  updateLawyerReviewsLoader(bool newValue) {
    allLawyerReviewsLoader = newValue;
    update();
  }

  GetLawyerReviewsDataModel getLawyerReviewsDataModel =
      GetLawyerReviewsDataModel();

  List<ReviewModel> lawyerReviewsListForPagination = [];

  // updateSelectedLawyerForView(
  //   LawyerModel newValue,
  // ) {
  //   selectedLawyerForView = newValue;

  //   update();
  // }

  ///------------------------------- Lawyers-data-check
  bool getLawyerReviewsDataCheck = false;
  getLawyerReviewsDataCheckCheck(bool value) {
    getLawyerReviewsDataCheck = value;
    update();
  }

  int? selectedLawyerReviewsCategoryIndex = 0;
  updateSelectedLawyerReviewsCategoryIndex(int? newValue) {
    selectedLawyerReviewsCategoryIndex = newValue;
    update();
  }

  /// paginated-data-fetch
  Future paginationDataLoad(BuildContext context) async {
    // perform fetching data delay
    // await new Future.delayed(new Duration(seconds: 2));

    log("load more");
    // update data and loading status
    if (getLawyerReviewsModel.data!.meta!.lastPage! >
        getLawyerReviewsModel.data!.meta!.currentPage!) {
      Get.find<GeneralController>().changeGetPaginationProgressCheck(true);

      postMethod(
          context,
          '${getLawyerReviewsModel.data!.meta!.path}',
          {
            'page': (getLawyerReviewsModel.data!.meta!.currentPage! + 1),
            'perPage': getLawyerReviewsModel.data!.meta!.perPage
          },
          false,
          getLawyerReviewsRepo);
      update();
    }
  }

  updateLawyerReviewsListForPagination(ReviewModel lawyerReviewsModel) {
    lawyerReviewsListForPagination.add(lawyerReviewsModel);
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
