import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/all_featured_lawyers_controller.dart';
import '../models/all_featured_lawyers_model.dart';

getAllFeaturedLawyersRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<AllFeaturedLawyersController>().getAllFeaturedLawyersModel =
        GetAllFeaturedLawyersModel.fromJson(response);

    Get.find<AllFeaturedLawyersController>().updatefeaturedLawyersLoader(true);

    // if (Get.find<AllLawyersCategoriesController>().getAllLawyerCategoriesDataModel.status == true) {
    // } else {}
  } else if (!responseCheck) {
    Get.find<AllFeaturedLawyersController>().updatefeaturedLawyersLoader(true);
  }
}
