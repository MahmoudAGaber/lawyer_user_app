import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/general_controller.dart';
import '../controllers/lawyer_broadcasts_controller.dart';
import '../models/lawyer_broadcasts_model.dart';

getLawyerBroadcastsRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<LawyerBroadcastsController>().getLawyerBroadcastsModel =
        GetLawyerBroadcastsModel.fromJson(response);

    Get.find<LawyerBroadcastsController>().updateLawyerBroadcastsLoader(true);
    log("${Get.find<LawyerBroadcastsController>().getLawyerBroadcastsModel.data!.data!.length.toString()} Total Lawyers Broadcasts Length");

    for (var element in Get.find<LawyerBroadcastsController>()
        .getLawyerBroadcastsModel
        .data!
        .data!) {
      Get.find<LawyerBroadcastsController>()
          .updateLawyerBroadcastsListForPagination(element);
    }

    Get.find<GeneralController>().changeGetPaginationProgressCheck(false);

    // if (Get.find<AllLawyersCategoriesController>().getAllLawyerCategoriesDataModel.status == true) {
    // } else {}
  } else if (!responseCheck) {
    Get.find<LawyerBroadcastsController>().updateLawyerBroadcastsLoader(true);
  }
}
