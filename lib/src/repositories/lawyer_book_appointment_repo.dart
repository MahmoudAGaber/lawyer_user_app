import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/general_controller.dart';

import '../controllers/lawyer_book_appointment_controller.dart';
import '../models/lawyer_appointment_schedule_model.dart';

getLawyerBookAppointmentRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<LawyerAppointmentScheduleController>()
            .getLawyerAppointmentScheduleModel =
        GetLawyerAppointmentScheduleModel.fromJson(response);
    Get.find<LawyerAppointmentScheduleController>()
        .updateLawyerBookAppointmentLoader(true);
    log("${Get.find<LawyerAppointmentScheduleController>().getLawyerAppointmentScheduleModel.data!} Total Lawyer Book Appointment Length");

    Get.find<GeneralController>().changeGetPaginationProgressCheck(false);
  } else if (!responseCheck) {
    Get.find<LawyerAppointmentScheduleController>()
        .updateLawyerBookAppointmentLoader(true);
  }
}
