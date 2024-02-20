import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawyer_consultant/src/models/lawyer_appointment_types_model.dart';

import '../controllers/general_controller.dart';
import '../controllers/lawyer_appointment_types_controller.dart';

getLawyerAppointmentTypesRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<LawyerAppointmentTypesController>()
            .getLawyerAppointmentTypesModel =
        GetLawyerAppointmentTypesModel.fromJson(response);

    Get.find<LawyerAppointmentTypesController>()
        .updateLawyerAppointmentTypesLoader(true);
    log("${Get.find<LawyerAppointmentTypesController>().getLawyerAppointmentTypesModel.data!.length.toString()} Total Lawyer Appointment Types Length");

    Get.find<GeneralController>().changeGetPaginationProgressCheck(false);
  } else if (!responseCheck) {
    Get.find<LawyerAppointmentTypesController>()
        .updateLawyerAppointmentTypesLoader(true);
  }
}
