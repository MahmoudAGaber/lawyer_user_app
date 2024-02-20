import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/all_lawyer_categories_controller.dart';
import '../models/all_lawyer_categories_model.dart';

getAllLawyerCategoriesRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<AllLawyersCategoriesController>().getAllLawyerCategoriesModel =
        GetAllLawyerCategoriesModel.fromJson(response);

    Get.find<AllLawyersCategoriesController>()
        .updatelawyerCategoriesLoader(true);

    // if (Get.find<AllLawyersCategoriesController>().getAllLawyerCategoriesDataModel.status == true) {
    // } else {}
  } else if (!responseCheck) {
    Get.find<AllLawyersCategoriesController>()
        .updatelawyerCategoriesLoader(true);
  }
}
