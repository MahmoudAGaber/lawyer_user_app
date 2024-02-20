import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';
import '../api_services/post_service.dart';
import '../models/law_firm_reviews_model.dart';
import '../models/lawyer_reviews_model.dart';
import '../repositories/law_firm_reviews_repo.dart';
import 'general_controller.dart';

class LawFirmReviewsController extends GetxController {
  GetLawFirmReviewsModel getLawFirmReviewsModel = GetLawFirmReviewsModel();

  bool allLawFirmReviewsLoader = false;
  updateLawFirmReviewsLoader(bool newValue) {
    allLawFirmReviewsLoader = newValue;
    update();
  }

  GetLawFirmReviewsDataModel getLawFirmReviewsDataModel =
      GetLawFirmReviewsDataModel();

  List<ReviewModel> lawyerReviewsListForPagination = [];

  // updateSelectedLawFirmForView(
  //   LawFirmModel newValue,
  // ) {
  //   selectedLawFirmForView = newValue;

  //   update();
  // }

  ///------------------------------- LawFirms-data-check
  bool getLawFirmReviewsDataCheck = false;
  getLawFirmReviewsDataCheckCheck(bool value) {
    getLawFirmReviewsDataCheck = value;
    update();
  }

  int? selectedLawFirmReviewsCategoryIndex = 0;
  updateSelectedLawFirmReviewsCategoryIndex(int? newValue) {
    selectedLawFirmReviewsCategoryIndex = newValue;
    update();
  }

  /// paginated-data-fetch
  Future paginationDataLoad(BuildContext context) async {
    // perform fetching data delay
    // await new Future.delayed(new Duration(seconds: 2));

    log("load more");
    // update data and loading status
    if (getLawFirmReviewsModel.data!.meta!.lastPage! >
        getLawFirmReviewsModel.data!.meta!.currentPage!) {
      Get.find<GeneralController>().changeGetPaginationProgressCheck(true);

      postMethod(
          context,
          '${getLawFirmReviewsModel.data!.meta!.path}',
          {
            'page': (getLawFirmReviewsModel.data!.meta!.currentPage! + 1),
            'perPage': getLawFirmReviewsModel.data!.meta!.perPage
          },
          false,
          getLawFirmReviewsRepo);
      update();
    }
  }

  updateLawFirmReviewsListForPagination(ReviewModel lawyerReviewsModel) {
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
