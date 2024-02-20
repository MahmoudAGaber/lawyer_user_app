import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawyer_consultant/src/controllers/law_firm_reviews_controller.dart';

import '../controllers/general_controller.dart';
import '../models/law_firm_reviews_model.dart';

getLawFirmReviewsRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<LawFirmReviewsController>().getLawFirmReviewsModel =
        GetLawFirmReviewsModel.fromJson(response);

    Get.find<LawFirmReviewsController>().updateLawFirmReviewsLoader(true);
    log("${Get.find<LawFirmReviewsController>().getLawFirmReviewsModel.data!.data!.length.toString()} Total LawFirms Length");

    for (var element in Get.find<LawFirmReviewsController>()
        .getLawFirmReviewsModel
        .data!
        .data!) {
      Get.find<LawFirmReviewsController>()
          .updateLawFirmReviewsListForPagination(element);
    }

    Get.find<GeneralController>().changeGetPaginationProgressCheck(false);

    // if (Get.find<AllLawyersCategoriesController>().getAllLawyerCategoriesDataModel.status == true) {
    // } else {}
  } else if (!responseCheck) {
    Get.find<LawFirmReviewsController>().updateLawFirmReviewsLoader(true);
  }
}
