import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/general_controller.dart';
import '../controllers/lawyer_reviews_controller.dart';
import '../models/lawyer_reviews_model.dart';

getLawyerReviewsRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<LawyerReviewsController>().getLawyerReviewsModel =
        GetLawyerReviewsModel.fromJson(response);

    Get.find<LawyerReviewsController>().updateLawyerReviewsLoader(true);
    log("${Get.find<LawyerReviewsController>().getLawyerReviewsModel.data!.data!.length.toString()} Total Lawyers Length");

    for (var element in Get.find<LawyerReviewsController>()
        .getLawyerReviewsModel
        .data!
        .data!) {
      Get.find<LawyerReviewsController>()
          .updateLawyerReviewsListForPagination(element);
    }

    Get.find<GeneralController>().changeGetPaginationProgressCheck(false);
  } else if (!responseCheck) {
    Get.find<LawyerReviewsController>().updateLawyerReviewsLoader(true);
  }
}
