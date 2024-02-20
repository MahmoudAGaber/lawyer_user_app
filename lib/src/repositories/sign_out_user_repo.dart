import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/app_colors.dart';
import '../controllers/general_controller.dart';
import '../controllers/pusher_beams_controller.dart';
import '../controllers/sign_out_user_controller.dart';

import '../routes.dart';
import '../widgets/custom_dialog.dart';

signOutUserRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    // Get.find<LoggedInUserController>().loggedInUserModel =
    //     GetLoggedInUserModel.fromJson(response);

    Get.find<GeneralController>().storageBox.erase();

    Get.find<GeneralController>().storageBox.remove('userData');
    Get.find<GeneralController>().storageBox.remove('seen');
    Get.find<GeneralController>().storageBox.remove('userID');
    // Get.find<GeneralController>().box.remove('localToken');
    Get.find<GeneralController>().currentUserModel = null;

    Get.find<SignOutUserController>().updateSignOutLoaderController(false);

    Get.offAndToNamed(PageRoutes.homeScreen);
    if (response["success"] == true) {
      Get.find<PusherBeamsController>().clearAllStatePusherBeams();
      Get.find<PusherBeamsController>().clearDeviceInterests();
      Get.find<GeneralController>().updateFormLoaderController(false);
      // Get.toNamed(PageRoutes.signinScreen);
    }
  } else {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
            title: "Please Try Again",
            titleColor: AppColors.customDialogErrorColor,
            descriptions: '${response["message"]}',
            text: "Ok",
            functionCall: () {
              Navigator.pop(context);
            },
            img: 'assets/icons/dialog_error.png',
          );
        });
  }
}
