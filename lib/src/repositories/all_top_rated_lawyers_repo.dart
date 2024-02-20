import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/all_top_rated_lawyers_controller.dart';
import '../models/all_top_rated_lawyers_model.dart';

getAllTopRatedLawyersRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<AllTopRatedLawyersController>().getAllTopRatedLawyersModel =
        GetAllTopRatedLawyersModel.fromJson(response);

    Get.find<AllTopRatedLawyersController>().updateTopRatedLawyersLoader(true);

    // if (Get.find<AllLawyersCategoriesController>().getAllLawyerCategoriesDataModel.status == true) {
    // } else {}
  } else if (!responseCheck) {
    Get.find<AllTopRatedLawyersController>().updateTopRatedLawyersLoader(true);
  }
}
