import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/general_controller.dart';
import '../controllers/make_payment_controller.dart';
import '../controllers/signin_controller.dart';
import '../models/wallet_topup_model.dart';
import '../screens/webview_screen.dart';

makeWalletTopupRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<MakePaymentController>().walletTopupModel =
        WalletTopupModel.fromJson(response);
    Get.to(WebViewScreen(
      urlEndPoint:
          "${Get.find<MakePaymentController>().walletTopupModel.data!.fundTransaction}?user_id=${Get.find<GeneralController>().storageBox.read('mainUserId')}",
    ));
    print(
        "${Get.find<MakePaymentController>().walletTopupModel.data!.fundTransaction}?user_id=${Get.find<GeneralController>().storageBox.read('mainUserId')} PAYMENTURL");
    Get.find<MakePaymentController>().update();
  } else if (!responseCheck) {
    // Get.find<LawyerProfileController>().updateConsultantProfileLoader(false);
    Get.find<GeneralController>().updateFormLoaderController(false);
  }
}
