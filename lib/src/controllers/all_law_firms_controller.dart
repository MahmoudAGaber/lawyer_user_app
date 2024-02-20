import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';
import '../api_services/post_service.dart';
import '../models/all_events_model.dart';
import '../models/all_law_firms_model.dart';
import '../repositories/all_events_repo.dart';
import 'general_controller.dart';

class AllLawFirmsController extends GetxController {
  GetAllLawFirmsModel getAllLawFirmsModel = GetAllLawFirmsModel();

  bool allLawFirmsLoader = false;
  updateLawFirmsLoader(bool newValue) {
    allLawFirmsLoader = newValue;
    update();
  }

  EventModel selectedEventForView = EventModel();
  GetAllEventsDataModel getAllEventsDataModel = GetAllEventsDataModel();

  List<LawFirmModel> lawFirmsListForPagination = [];

  ///------------------------------- Law-Firms-data-check
  bool getLawFirmsDataCheck = false;
  getLawFirmsDataCheckCheck(bool value) {
    getLawFirmsDataCheck = value;
    update();
  }

  int? selectedLawFirmsCategoryIndex = 0;
  updateSelectedEventsCategoryIndex(int? newValue) {
    selectedLawFirmsCategoryIndex = newValue;
    update();
  }

  /// paginated-data-fetch
  Future paginationDataLoad(BuildContext context) async {
    // perform fetching data delay
    // await new Future.delayed(new Duration(seconds: 2));

    log("load more");
    // update data and loading status
    if (getAllLawFirmsModel.data!.meta!.lastPage! >
        getAllLawFirmsModel.data!.meta!.currentPage!) {
      Get.find<GeneralController>().changeGetPaginationProgressCheck(true);

      postMethod(
          context,
          '${getAllLawFirmsModel.data!.meta!.path}',
          {
            'page': (getAllLawFirmsModel.data!.meta!.currentPage! + 1),
            'perPage': getAllLawFirmsModel.data!.meta!.perPage
          },
          false,
          getAllEventsRepo);
      update();
    }
  }

  updateLawFirmsListForPagination(LawFirmModel lawFirmModel) {
    lawFirmsListForPagination.add(lawFirmModel);
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
