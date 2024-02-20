import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/all_lawyers_controller.dart';
import '../controllers/general_controller.dart';
import '../models/all_lawyers_model.dart';

getAllLawyersRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<AllLawyersController>().getAllLawyersModel =
        GetAllLawyersModel.fromJson(response);

    Get.find<AllLawyersController>().updateLawyersLoader(true);
    log("${Get.find<AllLawyersController>().getAllLawyersModel.data!.data!.length.toString()} Total Lawyers Length");

    for (var element
        in Get.find<AllLawyersController>().getAllLawyersModel.data!.data!) {
      Get.find<AllLawyersController>().updateLawyerListForPagination(element);
    }

    Get.find<GeneralController>().changeGetPaginationProgressCheck(false);

    // if (Get.find<AllLawyersCategoriesController>().getAllLawyerCategoriesDataModel.status == true) {
    // } else {}
  } else if (!responseCheck) {
    Get.find<AllLawyersController>().updateLawyersLoader(true);
  }
}

getAllSearchedLawyersRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    if (Get.find<AllLawyersController>().lawyerListForPagination.isNotEmpty) {
      Get.find<AllLawyersController>().lawyerListForPagination = [];
    }
    Get.find<AllLawyersController>().getAllLawyersModel =
        GetAllLawyersModel.fromJson(response);

    Get.find<AllLawyersController>().updateLawyersLoader(true);
    log("${Get.find<AllLawyersController>().getAllLawyersModel.data!.data!.length.toString()} Total Lawyers Length");

    for (var element
        in Get.find<AllLawyersController>().getAllLawyersModel.data!.data!) {
      Get.find<AllLawyersController>().updateLawyerListForPagination(element);
    }

    Get.find<GeneralController>().changeGetPaginationProgressCheck(false);

    // if (Get.find<AllLawyersCategoriesController>().getAllLawyerCategoriesDataModel.status == true) {
    // } else {}
  } else if (!responseCheck) {
    Get.find<AllLawyersController>().updateLawyersLoader(true);
  }
}
