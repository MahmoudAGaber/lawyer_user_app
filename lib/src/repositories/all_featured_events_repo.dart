import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/all_featured_events_controller.dart';
import '../models/all_featured_events_model.dart';

getAllFeaturedEventsRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<AllFeaturedEventsController>().getAllFeaturedEventsModel =
        GetAllFeaturedEventsModel.fromJson(response);

    Get.find<AllFeaturedEventsController>().updateEventLoader(true);

    // if (Get.find<AllLawyersCategoriesController>().getAllLawyerCategoriesDataModel.status == true) {
    // } else {}
  } else if (!responseCheck) {
    Get.find<AllFeaturedEventsController>().updateEventLoader(true);
  }
}
