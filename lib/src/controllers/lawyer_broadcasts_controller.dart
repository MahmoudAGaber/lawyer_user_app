import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';
import '../api_services/post_service.dart';
import '../models/lawyer_broadcasts_model.dart';
import '../repositories/lawyer_broadcasts_repo.dart';
import 'general_controller.dart';

class LawyerBroadcastsController extends GetxController {
  GetLawyerBroadcastsModel getLawyerBroadcastsModel =
      GetLawyerBroadcastsModel();

  bool allLawyerBroadcastsLoader = false;
  updateLawyerBroadcastsLoader(bool newValue) {
    allLawyerBroadcastsLoader = newValue;
    update();
  }

  GetLawyerBroadcastsDataModel getLawyerBroadcastsDataModel =
      GetLawyerBroadcastsDataModel();

  List<BroadcastModel> lawyerBroadcastsListForPagination = [];

  // updateSelectedLawyerForView(
  //   LawyerModel newValue,
  // ) {
  //   selectedLawyerForView = newValue;

  //   update();
  // }

  ///------------------------------- Lawyers-data-check
  bool getLawyerBroadcastsDataCheck = false;
  getLawyerBroadcastsDataCheckCheck(bool value) {
    getLawyerBroadcastsDataCheck = value;
    update();
  }

  int? selectedLawyerBroadcastsCategoryIndex = 0;
  updateSelectedLawyerBroadcastsCategoryIndex(int? newValue) {
    selectedLawyerBroadcastsCategoryIndex = newValue;
    update();
  }

  /// paginated-data-fetch
  Future paginationDataLoad(BuildContext context) async {
    // perform fetching data delay
    // await new Future.delayed(new Duration(seconds: 2));

    log("load more");
    // update data and loading status
    if (getLawyerBroadcastsModel.data!.meta!.lastPage! >
        getLawyerBroadcastsModel.data!.meta!.currentPage!) {
      Get.find<GeneralController>().changeGetPaginationProgressCheck(true);

      postMethod(
          context,
          '${getLawyerBroadcastsModel.data!.meta!.path}',
          {
            'page': (getLawyerBroadcastsModel.data!.meta!.currentPage! + 1),
            'perPage': getLawyerBroadcastsModel.data!.meta!.perPage
          },
          false,
          getLawyerBroadcastsRepo);
      update();
    }
  }

  updateLawyerBroadcastsListForPagination(
      BroadcastModel lawyerBroadcastsModel) {
    lawyerBroadcastsListForPagination.add(lawyerBroadcastsModel);
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
