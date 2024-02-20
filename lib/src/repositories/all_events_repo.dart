import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/all_events_controller.dart';
import '../controllers/general_controller.dart';
import '../models/all_events_model.dart';

getAllEventsRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<AllEventsController>().getAllEventsModel =
        GetAllEventsModel.fromJson(response);

    Get.find<AllEventsController>().updateEventsLoader(true);
    log("${Get.find<AllEventsController>().getAllEventsModel.data!.data!.length.toString()} Total Events Length");

    for (var element
        in Get.find<AllEventsController>().getAllEventsModel.data!.data!) {
      Get.find<AllEventsController>().updateEventsListForPagination(element);
    }

    Get.find<GeneralController>().changeGetPaginationProgressCheck(false);

    // if (Get.find<AllLawyersCategoriesController>().getAllLawyerCategoriesDataModel.status == true) {
    // } else {}
  } else if (!responseCheck) {
    Get.find<AllEventsController>().updateEventsLoader(true);
  }
}
