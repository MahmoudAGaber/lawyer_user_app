import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';

import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../controllers/general_controller.dart';
import '../controllers/make_payment_controller.dart';
import '../controllers/signin_controller.dart';
import '../models/book_appointment_model.dart';
import '../screens/webview_screen.dart';
import '../widgets/button_widget.dart';

makePaymentRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<MakePaymentController>().bookAppointmentModel =
        BookAppointmentModel.fromJson(response);
    Get.to(WebViewScreen(
      urlEndPoint:
          "${Get.find<MakePaymentController>().bookAppointmentModel.data!.fundTransaction}?user_id=${Get.find<GeneralController>().storageBox.read('mainUserId')}",
      fromScreen: "Appointment Screen",
    ));
    print(
        "${Get.find<MakePaymentController>().bookAppointmentModel.data!.fundTransaction}?user_id=${Get.find<GeneralController>().storageBox.read('mainUserId')} PAYMENTURL");
    Get.find<MakePaymentController>().update();
  } else if (!responseCheck) {
    // Get.find<LawyerProfileController>().updateConsultantProfileLoader(false);
    Get.find<GeneralController>().updateFormLoaderController(false);
  }
}

makePaymentViaWalletRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<MakePaymentController>().bookAppointmentModel =
        BookAppointmentModel.fromJson(response);
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.offWhite,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 36, 0, 24),
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.primaryColor),
                    child: const Icon(
                      Icons.check,
                      size: 36,
                      color: AppColors.offWhite,
                    ),
                  ),
                  const Text(
                    "Thank You",
                    style: AppTextStyles.headingTextStyle3,
                  ),
                  SizedBox(height: 8.h),
                  const Center(
                    child: Text(
                      "Your Payment has been Successfully Recieved",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyTextStyle2,
                    ),
                  ),
                  SizedBox(height: 36.h),
                ],
              ),
            ),
            SizedBox(height: 36.h),
            ButtonWidgetOne(
                onTap: () {
                  Get.back();
                  Get.back();
                },
                buttonText: "Ok",
                buttonTextStyle: AppTextStyles.bodyTextStyle8,
                borderRadius: 10,
                buttonColor: AppColors.primaryColor),
          ],
        ),
      ),
    );
    Get.find<MakePaymentController>().update();
  } else if (!responseCheck) {
    // Get.find<LawyerProfileController>().updateConsultantProfileLoader(false);
    Get.find<GeneralController>().updateFormLoaderController(false);
  }
}
