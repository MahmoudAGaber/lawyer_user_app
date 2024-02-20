import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lawyer_consultant/src/controllers/signin_controller.dart';

import '../config/app_colors.dart';
import '../controllers/general_controller.dart';

import '../widgets/custom_dialog.dart';

loggedInUserRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    print(
        "${jsonEncode(Get.find<GeneralController>().currentUserModel)} Logged In User Data Test");
  } else {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
            title: "Please Try Again",
            titleColor: AppColors.customDialogErrorColor,
            descriptions:
                '${Get.find<SigninController>().signInUserModel.message}',
            text: "Ok",
            functionCall: () {
              Navigator.pop(context);
            },
            img: 'assets/icons/dialog_error.png',
          );
        });
  }
}
