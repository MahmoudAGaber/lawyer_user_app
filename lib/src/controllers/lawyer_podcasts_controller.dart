import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';
import '../api_services/post_service.dart';
import '../models/lawyer_podcasts_model.dart';
import '../repositories/lawyer_podcasts_repo.dart';
import 'general_controller.dart';

class LawyerPodcastsController extends GetxController {
  GetLawyerPodcastsModel getLawyerPodcastsModel = GetLawyerPodcastsModel();

  bool allLawyerPodcastsLoader = false;
  updateLawyerPodcastsLoader(bool newValue) {
    allLawyerPodcastsLoader = newValue;
    update();
  }

  GetLawyerPodcastsDataModel getLawyerPodcastsDataModel =
      GetLawyerPodcastsDataModel();

  List<PodcastModel> lawyerPodcastsListForPagination = [];

  // updateSelectedLawyerForView(
  //   LawyerModel newValue,
  // ) {
  //   selectedLawyerForView = newValue;

  //   update();
  // }

  ///------------------------------- Lawyers-data-check
  bool getLawyerPodcastsDataCheck = false;
  getLawyerPodcastsDataCheckCheck(bool value) {
    getLawyerPodcastsDataCheck = value;
    update();
  }

  int? selectedLawyerPodcastsCategoryIndex = 0;
  updateSelectedLawyerPodcastsCategoryIndex(int? newValue) {
    selectedLawyerPodcastsCategoryIndex = newValue;
    update();
  }

  /// paginated-data-fetch
  Future paginationDataLoad(BuildContext context) async {
    // perform fetching data delay
    // await new Future.delayed(new Duration(seconds: 2));

    log("load more");
    // update data and loading status
    if (getLawyerPodcastsModel.data!.meta!.lastPage! >
        getLawyerPodcastsModel.data!.meta!.currentPage!) {
      Get.find<GeneralController>().changeGetPaginationProgressCheck(true);

      postMethod(
          context,
          '${getLawyerPodcastsModel.data!.meta!.path}',
          {
            'page': (getLawyerPodcastsModel.data!.meta!.currentPage! + 1),
            'perPage': getLawyerPodcastsModel.data!.meta!.perPage
          },
          false,
          getLawyerPodcastsRepo);
      update();
    }
  }

  updateLawyerPodcastsListForPagination(PodcastModel lawyerPodcastsModel) {
    lawyerPodcastsListForPagination.add(lawyerPodcastsModel);
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
