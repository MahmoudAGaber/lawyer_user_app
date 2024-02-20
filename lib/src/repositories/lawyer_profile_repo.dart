import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/general_controller.dart';
import '../controllers/lawyer_profile_controller.dart';
import '../models/lawyer_profile_model.dart';

getLawyerProfileRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<LawyerProfileController>().lawyerProfileModel =
        GetLawyerProfileModel.fromJson(response);
    Get.find<LawyerProfileController>().update();
  } else if (!responseCheck) {
    // Get.find<LawyerProfileController>().updateConsultantProfileLoader(false);
    Get.find<GeneralController>().updateFormLoaderController(false);
  }
}
