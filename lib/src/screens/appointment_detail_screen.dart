import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:resize/resize.dart';

import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../controllers/general_controller.dart';

import '../routes.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/button_widget.dart';

class AppointmentDetailScreen extends StatefulWidget {
  const AppointmentDetailScreen({super.key});

  @override
  State<AppointmentDetailScreen> createState() =>
      AppointmentDetailScreenState();
}

class AppointmentDetailScreenState extends State<AppointmentDetailScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(builder: (generalController) {
      return Scaffold(
        backgroundColor: AppColors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: AppBarWidget(
            leadingIcon: 'assets/icons/Expand_left.png',
            leadingOnTap: () {
              Get.back();
            },
            richTextSpan: const TextSpan(
              text: 'Appointment Detail',
              style: AppTextStyles.appbarTextStyle2,
              children: <TextSpan>[],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                decoration: BoxDecoration(
                  gradient: AppColors.gradientOne,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    generalController.selectedAppointmentHistoryForView
                                .lawyerImage ==
                            null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: Image.asset(
                              scale: 4.h,
                              'assets/images/lawyer-image.png',
                              fit: BoxFit.cover,
                              height: 110.h,
                              width: 120.w,
                            ))
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: Image.network(
                              scale: 4.h,
                              '$mediaUrl${generalController.selectedAppointmentHistoryForView.lawyerImage!}',
                              fit: BoxFit.cover,
                              height: 110.h,
                              width: 120.w,
                            ),
                          ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // "Lawyer Name",
                              generalController
                                  .selectedAppointmentHistoryForView
                                  .lawyerName!,
                              style: AppTextStyles.bodyTextStyle5,
                            ),
                            SizedBox(height: 16.h),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(10.w, 4.h, 10.w, 4.h),
                              decoration: BoxDecoration(
                                  color: generalController
                                              .selectedAppointmentHistoryForView
                                              .appointmentStatusCode! ==
                                          1
                                      ? AppColors.primaryColor
                                      : generalController
                                                  .selectedAppointmentHistoryForView
                                                  .appointmentStatusCode! ==
                                              5
                                          ? AppColors.green.withOpacity(0.5)
                                          : generalController
                                                      .selectedAppointmentHistoryForView
                                                      .appointmentStatusCode! ==
                                                  2
                                              ? AppColors.orange
                                                  .withOpacity(0.5)
                                              : AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                // "Pending",
                                generalController
                                    .selectedAppointmentHistoryForView
                                    .appointmentStatusName!,
                                style: AppTextStyles.bodyTextStyle13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.h),
              Container(
                padding: EdgeInsets.fromLTRB(14.w, 17.h, 14.w, 17.h),
                margin: EdgeInsets.only(bottom: 18.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.offWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Appointment Type",
                      style: AppTextStyles.headingTextStyle5,
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      // "Appointment Type",
                      generalController.selectedAppointmentHistoryForView
                          .appointmentTypeName!,
                      style: AppTextStyles.bodyTextStyle7,
                    ),
                    SizedBox(height: 18.h),
                    Text(
                      "Date & Time",
                      style: AppTextStyles.headingTextStyle5,
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      "${generalController.selectedAppointmentHistoryForView.date!} | ${generalController.selectedAppointmentHistoryForView.startTime ?? ""}",
                      style: AppTextStyles.bodyTextStyle7,
                    ),
                    SizedBox(height: 18.h),
                    Text(
                      "Questions",
                      style: AppTextStyles.headingTextStyle5,
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      generalController
                          .selectedAppointmentHistoryForView.question!,
                      style: AppTextStyles.bodyTextStyle7,
                    ),
                    SizedBox(height: 18.h),
                    Text(
                      "Payment Status",
                      style: AppTextStyles.headingTextStyle5,
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      generalController
                                  .selectedAppointmentHistoryForView.isPaid ==
                              1
                          ? "Paid"
                          : "Not Paid",
                      style: AppTextStyles.bodyTextStyle7,
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 18.h),
              Container(
                padding: EdgeInsets.fromLTRB(14.w, 17.h, 14.w, 17.h),
                margin: EdgeInsets.only(bottom: 18.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.offWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Attachments",
                      style: AppTextStyles.headingTextStyle5,
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      "",
                      // generalController
                      //     .selectedAppointmentHistoryForView.attachmentUrl!
                      //     .toString(),
                      style: AppTextStyles.bodyTextStyle7,
                    ),
                  ],
                ),
              ),

              generalController.selectedAppointmentHistoryForView
                              .appointmentStatusCode ==
                          2 &&
                      generalController.selectedAppointmentHistoryForView
                              .appointmentTypeId ==
                          3
                  ? ButtonWidgetOne(
                      onTap: () {
                        Get.toNamed(PageRoutes.liveChatScreen);
                      },
                      buttonText: "Chat Now",
                      buttonTextStyle: AppTextStyles.bodyTextStyle8,
                      borderRadius: 10,
                      buttonColor: AppColors.primaryColor)
                  : Container(),
            ],
          ),
        ),
      );
    });
  }
}
