import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/lawyer_main_categories_controller.dart';
import '../models/lawyer_main_categories_model.dart';

getLawyerMainCategoriesRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<LawyerMainCategoriesController>().getLawyerMainCategoriesModel =
        GetLawyerMainCategoriesModel.fromJson(response);

    Get.find<LawyerMainCategoriesController>()
        .updatelawyerMainCategoriesLoader(true);

    // if (Get.find<LawyerMainCategoriesController>().getAllLawyerCategoriesDataModel.status == true) {
    // } else {}
  } else if (!responseCheck) {
    Get.find<LawyerMainCategoriesController>()
        .updatelawyerMainCategoriesLoader(true);
  }
}
