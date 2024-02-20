import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawyer_consultant/src/config/app_colors.dart';

import '../controllers/general_controller.dart';
import '../controllers/signup_controller.dart';
import '../widgets/custom_dialog.dart';

signUpWithEmailRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<GeneralController>().updateFormLoaderController(false);
    if (response['success'].toString() == 'true') {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return CustomDialogBox(
              title: 'Success',
              titleColor: AppColors.customDialogSuccessColor,
              descriptions: "Let's Login",
              text: "Ok",
              functionCall: () {
                Navigator.pop(context);
                Get.back();
              },
              img: 'assets/icons/mastercard-full-svgrepo-com 1.png',
            );
          });
    } else {
      if (response['errors'].containsKey('email')) {
        Get.find<SignUpController>().emailValidator =
            response['errors']['email'][0];
        Get.find<SignUpController>().update();
      }
    }
  } else if (!responseCheck) {
    Get.find<GeneralController>().updateFormLoaderController(false);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
            title: "Error",
            titleColor: AppColors.customDialogErrorColor,
            descriptions: 'Please Try Again',
            text: "Ok",
            functionCall: () {
              Navigator.pop(context);
            },
            img: 'assets/icons/mastercard-full-svgrepo-com 1.png',
          );
        });
  }
}
