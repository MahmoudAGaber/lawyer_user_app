import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio_instance;
import '../api_services/get_service.dart';
import '../api_services/header.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../controllers/general_controller.dart';
import '../models/logged_in_user_model.dart';

import '../widgets/custom_dialog.dart';
import 'logged_in_user_repo.dart';

editUserProfileDataRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    // getMethod(context, getLoggedInUserUrl, null, true, loggedInUserRepo);
    if (response['success'].toString() == 'true') {
      print("${response['data']} Response Data 1");
      log("${Get.find<GeneralController>().storageBox.read('userData')} Response Data 1.1");
      log("${jsonEncode(Get.find<GeneralController>().currentUserModel)} Response Data 1.2");
      log("${jsonEncode(User.fromJson(response['data']))} Response Data 1.3");
      Get.find<GeneralController>().currentUserModel = User.fromJson(response);
      if (Get.find<GeneralController>().storageBox.hasData('userData')) {
        Get.find<GeneralController>().currentUserModel =
            // GetLoggedInUserDataModel.fromJson(jsonDecode(
            //     Get.find<GeneralController>().storageBox.read('userData')));
            User.fromJson(response['data']);
      }

      print(
          "${Get.find<GeneralController>().storageBox.read('userData')} Response Data 2");
      // Get.find<EditUserProfileController>().update();
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return CustomDialogBox(
              title: 'Success!',
              titleColor: AppColors.customDialogSuccessColor,
              descriptions: "Profile Updated Successfully",
              text: "Ok",
              functionCall: () {
                Navigator.pop(context);
                Get.back();
              },
              img: 'assets/icons/dialog_success.png',
            );
          });
      Get.find<GeneralController>().updateFormLoaderController(false);
    } else {
      print("$response False Response");
      showDialog(
          context: Get.context!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return CustomDialogBox(
              title: "Failed",
              titleColor: AppColors.customDialogErrorColor,
              descriptions: 'Inside Repo 1 Popup 1',
              text: 'Ok',
              functionCall: () {
                Navigator.pop(context);
              },
              img: 'assets/icons/dialog_error.png',
            );
          });
      Get.find<GeneralController>().updateFormLoaderController(false);
    }
  } else if (!responseCheck) {
    showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CustomDialogBox(
            title: "Failed",
            titleColor: AppColors.customDialogErrorColor,
            descriptions: 'Inside Repo 1 Popup 2',
            text: "Ok",
            functionCall: () {
              Navigator.pop(context);
            },
            img: 'assets/icons/dialog_error.png',
          );
        });
    Get.find<GeneralController>().updateFormLoaderController(false);
  }
}

editUserProfileImageRepo(
  String? firstName,
  String? lastName,
  String? userName,
  String? description,
  String? addressLine1,
  String? zipCode,
  File? file1,
) async {
  dio_instance.FormData formData =
      dio_instance.FormData.fromMap(<String, dynamic>{
    "logged-in-as": "customer",
    'first_name': firstName,
    'last_name': lastName,
    "user_name": userName,
    "description": description,
    "address_line_1": addressLine1,
    "zip_code": zipCode,
    "lawyer_categories": "1",
    'image': await dio_instance.MultipartFile.fromFile(
      file1!.path,
    )
  });
  dio_instance.Dio dio = dio_instance.Dio();
  setCustomHeader(dio, 'Authorization',
      'Bearer ${Get.find<GeneralController>().storageBox.read('authToken')}');
  setCustomHeader(dio, 'logged-in-as', 'customer');

  dio_instance.Response response;
  try {
    response = await dio.post(editUserProfileURL, data: formData);
    log("${response} Image Repo Response");

    if (response.statusCode == 200) {
      log("${response}Image Repo Response 2");
      if (response.data['success'].toString() == 'true') {
        getMethod(Get.context!, getLoggedInUserUrl, {'login_as': "customer"},
            true, loggedInUserRepo);
        Get.find<GeneralController>().currentUserModel =
            User.fromJson(response.data['data']);
        log("${response.data['data']}Image Repo Response 3");
        showDialog(
            context: Get.context!,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return CustomDialogBox(
                title: 'Succes',
                titleColor: AppColors.customDialogSuccessColor,
                descriptions: 'Profile Updated Successfully',
                text: 'Ok',
                functionCall: () {
                  Navigator.pop(context);
                  Get.back();
                },
                img: 'assets/icons/dialog_success.png',
              );
            });
        Get.find<GeneralController>().updateFormLoaderController(false);
      } else {
        showDialog(
            context: Get.context!,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return CustomDialogBox(
                title: 'Failed',
                titleColor: AppColors.customDialogErrorColor,
                descriptions: 'Inside Repo Popup 1',
                text: 'Ok',
                functionCall: () {
                  Navigator.pop(context);
                },
                img: 'assets/icons/dialog_error.png',
              );
            });
        Get.find<GeneralController>().updateFormLoaderController(false);
      }
    } else {
      Get.find<GeneralController>().updateFormLoaderController(false);
      showDialog(
          context: Get.context!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return CustomDialogBox(
              title: 'Failed',
              titleColor: AppColors.customDialogErrorColor,
              descriptions: 'Inside Repo Popup 2',
              text: 'Ok',
              functionCall: () {
                Navigator.pop(context);
              },
              img: 'assets/icons/dialog_error.png',
            );
          });
    }
  } on dio_instance.DioError catch (e) {
    log("${e} Image Cath Response");
    Get.find<GeneralController>().updateFormLoaderController(false);
    showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CustomDialogBox(
            title: 'Failed',
            titleColor: AppColors.customDialogErrorColor,
            descriptions: 'Inside Repo Popup 3',
            text: 'Ok',
            functionCall: () {
              Navigator.pop(context);
            },
            img: 'assets/icons/dialog_error.png',
          );
        });
    log('Exception..${e.response}');
  }
}
