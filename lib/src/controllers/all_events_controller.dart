import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';
import '../api_services/post_service.dart';
import '../models/all_events_model.dart';
import '../repositories/all_events_repo.dart';
import 'general_controller.dart';

class AllEventsController extends GetxController {
  GetAllEventsModel getAllEventsModel = GetAllEventsModel();

  bool allEventsLoader = false;
  updateEventsLoader(bool newValue) {
    allEventsLoader = newValue;
    update();
  }

  EventModel selectedEventForView = EventModel();
  GetAllEventsDataModel getAllEventsDataModel = GetAllEventsDataModel();

  List<EventModel> eventsListForPagination = [];

  updateSelectedEventForView(
    EventModel newValue,
  ) {
    selectedEventForView = newValue;

    update();
  }

  ///------------------------------- Lawyers-data-check
  bool getEventsDataCheck = false;
  getEventsDataCheckCheck(bool value) {
    getEventsDataCheck = value;
    update();
  }

  int? selectedEventsCategoryIndex = 0;
  updateSelectedEventsCategoryIndex(int? newValue) {
    selectedEventsCategoryIndex = newValue;
    update();
  }

  /// paginated-data-fetch
  Future paginationDataLoad(BuildContext context) async {
    // perform fetching data delay
    // await new Future.delayed(new Duration(seconds: 2));

    log("load more");
    // update data and loading status
    if (getAllEventsModel.data!.meta!.lastPage! >
        getAllEventsModel.data!.meta!.currentPage!) {
      Get.find<GeneralController>().changeGetPaginationProgressCheck(true);

      postMethod(
          context,
          '${getAllEventsModel.data!.meta!.path}',
          {
            'page': (getAllEventsModel.data!.meta!.currentPage! + 1),
            'perPage': getAllEventsModel.data!.meta!.perPage
          },
          false,
          getAllEventsRepo);
      update();
    }
  }

  updateEventsListForPagination(EventModel eventModel) {
    eventsListForPagination.add(eventModel);
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
