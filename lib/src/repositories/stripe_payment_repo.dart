import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:resize/resize.dart';

import '../config/app_colors.dart';
import '../config/app_text_styles.dart';

import '../controllers/lawyer_book_appointment_controller.dart';

import '../routes.dart';
import '../widgets/button_widget.dart';
import '../widgets/custom_dialog.dart';

stripePaymentRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
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
                  const SizedBox(height: 8),
                  Text(
                    "For your payment \$ ${Get.find<LawyerAppointmentScheduleController>().getLawyerAppointmentScheduleModel.data!.schedule!.fee!}",
                    style: AppTextStyles.bodyTextStyle2,
                  ),
                  SizedBox(height: 36.h),
                ],
              ),
            ),
            SizedBox(height: 36.h),
            ButtonWidgetOne(
                onTap: () {
                  Get.offAndToNamed(PageRoutes.appointmentHistoryScreen,
                      parameters: {"fromBookAppointment": "Yes"});
                },
                buttonText: "My Appointments",
                buttonTextStyle: AppTextStyles.bodyTextStyle8,
                borderRadius: 10,
                buttonColor: AppColors.primaryColor),
          ],
        ),
      ),
    );
  } else {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
            title: "Failed",
            titleColor: AppColors.customDialogErrorColor,
            descriptions: 'Please Try Again',
            text: "Ok",
            functionCall: () {
              Navigator.pop(context);
            },
            img: 'assets/icons/dialog_error.png',
          );
        });
  }
}
