import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';
import '../models/lawyer_appointment_schedule_model.dart';

class LawyerAppointmentScheduleController extends GetxController {
  GetLawyerAppointmentScheduleModel getLawyerAppointmentScheduleModel =
      GetLawyerAppointmentScheduleModel();

  TextEditingController videCallQuestionFieldController =
      TextEditingController();
  TextEditingController audioCallQuestionFieldController =
      TextEditingController();
  TextEditingController liveChatQuestionFieldController =
      TextEditingController();

  bool getLawyerBookAppointmentLoader = false;
  updateLawyerBookAppointmentLoader(bool newValue) {
    getLawyerBookAppointmentLoader = newValue;
    update();
  }

  String? selectedLawyerCategory;
  // LawyerModel selectedLawyerForView = LawyerModel();
  GetLawyerBookAppointmentDataModel getLawyerBookAppointmentDataModel =
      GetLawyerBookAppointmentDataModel();

  ///----app-bar-settings-----start
  ScrollController? scrollController;
  bool lastStatus = true;
  double height = 100.h;

  bool get isShrink {
    return scrollController!.hasClients &&
        scrollController!.offset > (height - kToolbarHeight);
  }

  void scrollListener() {
    if (isShrink != lastStatus) {
      lastStatus = isShrink;
      update();
    }
  }
}
