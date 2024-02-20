import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/general_controller.dart';
import '../controllers/lawyers_by_category_controller.dart';
import '../models/all_lawyers_model.dart';

getLawyersByCategoryRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<LawyersByCategoryController>().getAllLawyersModel =
        GetAllLawyersModel.fromJson(response);

    Get.find<LawyersByCategoryController>().updateLawyersByCategoryLoader(true);
    log("${Get.find<LawyersByCategoryController>().getAllLawyersModel.data!.data!.length.toString()} Total Lawyers From Category Length");

    for (var element in Get.find<LawyersByCategoryController>()
        .getAllLawyersModel
        .data!
        .data!) {
      Get.find<LawyersByCategoryController>()
          .updateLawyerListForPagination(element);
    }

    Get.find<GeneralController>().changeGetPaginationProgressCheck(false);

    // if (Get.find<AllLawyersCategoriesController>().getAllLawyerCategoriesDataModel.status == true) {
    // } else {}
  } else if (!responseCheck) {
    Get.find<LawyersByCategoryController>().updateLawyersByCategoryLoader(true);
  }
}
