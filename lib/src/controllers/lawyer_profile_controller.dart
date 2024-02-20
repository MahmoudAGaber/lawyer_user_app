import 'package:get/get.dart';

import '../models/lawyer_profile_model.dart';

class LawyerProfileController extends GetxController {
  GetLawyerProfileModel lawyerProfileModel = GetLawyerProfileModel();
  bool? alllawyerProfileLoader = true;

  updateLawyerProfileLoader(bool? newValue) {
    alllawyerProfileLoader = newValue;
    update();
  }

  bool? loader = true;
  updateLoaderForViewProfile(bool? newValue) {
    loader = newValue;
    update();
  }

  // List<ScheduleTypes> appointmentTypes = [];
  List imagesForAppointmentTypes = [
    ///---audio
    'assets/Icons/audio.svg',

    ///---video
    'assets/Icons/videoCallIcon.svg',

    ///---chat
    'assets/Icons/chatIcon.svg',

    ///---on-site
    'assets/Icons/physicalIcon.svg',

    ///---home-visit
    'assets/Icons/house-fill.svg',

    ///---Live
    'assets/Icons/live.svg',
  ];
}
