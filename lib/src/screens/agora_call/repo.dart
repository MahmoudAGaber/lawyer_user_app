import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/general_controller.dart';
import '../../routes.dart';
import 'get_agora_token_model.dart';

getAgoraTokenRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<GeneralController>().getAgoraTokenModel =
        GetAgoraTokenModel.fromJson(response);
    if (Get.find<GeneralController>().getAgoraTokenModel.status == true) {
      Get.find<GeneralController>().updateFormLoaderController(false);
      Get.find<GeneralController>().updateCallerType(1);
      if (Get.find<GeneralController>().goForCall!) {
        Get.find<GeneralController>().updateTokenForCall(
            Get.find<GeneralController>().getAgoraTokenModel.data!.token);

        Get.offNamed(PageRoutes.videoCallScreen);
      }
    } else {
      Get.find<GeneralController>().updateFormLoaderController(false);
    }
  } else if (!responseCheck) {
    Get.find<GeneralController>().updateFormLoaderController(false);
  }
}

getAgoraTokenForAudioRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<GeneralController>().getAgoraTokenModel =
        GetAgoraTokenModel.fromJson(response);
    if (Get.find<GeneralController>().getAgoraTokenModel.status == true) {
      Get.find<GeneralController>().updateFormLoaderController(false);
      Get.find<GeneralController>().updateCallerType(1);
      if (Get.find<GeneralController>().goForCall!) {
        Get.find<GeneralController>().updateTokenForCall(
            Get.find<GeneralController>().getAgoraTokenModel.data!.token);

        Get.offNamed(PageRoutes.audioCallScreen);
      }
    } else {
      Get.find<GeneralController>().updateFormLoaderController(false);
    }
  } else if (!responseCheck) {
    Get.find<GeneralController>().updateFormLoaderController(false);
  }
}

method1(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (response['success'].toString() == '1') {}
}
