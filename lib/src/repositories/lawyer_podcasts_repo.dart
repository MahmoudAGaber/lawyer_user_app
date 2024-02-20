import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/general_controller.dart';
import '../controllers/lawyer_podcasts_controller.dart';
import '../models/lawyer_podcasts_model.dart';

getLawyerPodcastsRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<LawyerPodcastsController>().getLawyerPodcastsModel =
        GetLawyerPodcastsModel.fromJson(response);

    Get.find<LawyerPodcastsController>().updateLawyerPodcastsLoader(true);
    log("${Get.find<LawyerPodcastsController>().getLawyerPodcastsModel.data!.data!.length.toString()} Total Lawyers Podcasts Length");

    for (var element in Get.find<LawyerPodcastsController>()
        .getLawyerPodcastsModel
        .data!
        .data!) {
      Get.find<LawyerPodcastsController>()
          .updateLawyerPodcastsListForPagination(element);
    }

    Get.find<GeneralController>().changeGetPaginationProgressCheck(false);

    // if (Get.find<AllLawyersCategoriesController>().getAllLawyerCategoriesDataModel.status == true) {
    // } else {}
  } else if (!responseCheck) {
    Get.find<LawyerPodcastsController>().updateLawyerPodcastsLoader(true);
  }
}
