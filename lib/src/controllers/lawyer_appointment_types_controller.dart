import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';

import '../models/lawyer_appointment_types_model.dart';

class LawyerAppointmentTypesController extends GetxController {
  GetLawyerAppointmentTypesModel getLawyerAppointmentTypesModel =
      GetLawyerAppointmentTypesModel();

  bool lawyerAppointmentTypesLoader = false;
  updateLawyerAppointmentTypesLoader(bool newValue) {
    lawyerAppointmentTypesLoader = newValue;
    update();
  }

  String? selectedLawyerCategory;
  // LawyerModel selectedLawyerForView = LawyerModel();
  GetLawyerAppointmentTypesDataModel getLawyerAppointmentTypesData =
      GetLawyerAppointmentTypesDataModel();

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
