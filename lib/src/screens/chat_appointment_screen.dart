import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:lawyer_consultant/src/widgets/button_widget.dart';
import 'package:resize/resize.dart';

import '../api_services/get_service.dart';
import '../api_services/post_service.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../controllers/all_settings_controller.dart';
import '../controllers/general_controller.dart';
import '../controllers/lawyer_book_appointment_controller.dart';
import '../controllers/make_payment_controller.dart';
import '../controllers/payment_gateways_controller.dart';
import '../controllers/stripe_payment_controller.dart';
import '../repositories/get_payment_gateways_repo.dart';
import '../repositories/lawyer_book_appointment_repo.dart';

import '../repositories/make_payment_repo.dart';
import '../widgets/appbar_widget.dart';

class ChatAppointmentScreen extends StatefulWidget {
  // final num? appointmentTypeId;
  const ChatAppointmentScreen({
    super.key,
    // this.appointmentTypeId,
  });

  @override
  State<ChatAppointmentScreen> createState() => _ChatAppointmentScreenState();
}

class _ChatAppointmentScreenState extends State<ChatAppointmentScreen> {
  final lawyerAppointmentSchdulelogic =
      Get.put(LawyerAppointmentScheduleController());

  final paymentGatewaysLogic = Get.put(PaymentGatewaysController());
  final makePaymentLogic = Get.put(MakePaymentController());

  var appointmentTypeId = Get.parameters["appointmentTypeId"];
  String? screenTitle = Get.parameters["screenTitle"];
  String formattedDate = DateFormat.yMd().format(DateTime.now());
  String values = 'no';
  int indexPage = 0;
  int activeStep = 3;
  int upperBound = 4;
  bool boolValue = false;
  int? value;
  var selectedSlot;
  dynamic selectedPaymentGateway;
  DateTime selectedDate = DateTime.now();

  var dayToday = DateFormat('EEEE').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    // log("${Get.parameters['appointmentId']} PARAMETERS");
    log("$appointmentTypeId PARAMETERS2");
    print(
        "${Get.find<GeneralController>().selectedLawyerForView.userName} LawyerUsername1");
    getMethod(
        context,
        '$getLawyerBookAppointment${Get.find<GeneralController>().selectedLawyerForView.userName}/book_appointment',
        {"appointment_type_id": appointmentTypeId, "date": selectedDate},
        false,
        getLawyerBookAppointmentRepo);
    // Get All Payment Gateways
    getMethod(
        context, getPaymentGatewaysURL, null, false, getPaymentGatewaysRepo);
    print("$selectedDate DateNow");
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LawyerAppointmentScheduleController>(
        builder: (lawyerBookAppointmentController) {
      return Scaffold(
        backgroundColor: AppColors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: AppBarWidget(
            richTextSpan: TextSpan(
              text: screenTitle,
              style: AppTextStyles.appbarTextStyle2,
              children: const <TextSpan>[],
            ),
            leadingIcon: "assets/icons/Expand_left.png",
            leadingOnTap: () {
              if (indexPage > 0) {
                setState(() {
                  indexPage--;
                });
              } else {
                Get.back();
                indexPage = 0;
              }
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Divider(
                        thickness: 4,
                        height: 4,
                        color: indexPage >= 0
                            ? AppColors.primaryColor
                            : AppColors.lightGrey,
                      ),
                    ),
                  ),
                  Container(
                    height: 21,
                    width: 21,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: indexPage >= 0
                          ? AppColors.primaryColor
                          : AppColors.lightGrey,
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Divider(
                        thickness: 4,
                        height: 4,
                        color: indexPage >= 1
                            ? AppColors.primaryColor
                            : AppColors.lightGrey,
                      ),
                    ),
                  ),
                  Container(
                    height: 21,
                    width: 21,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: indexPage >= 1
                          ? AppColors.primaryColor
                          : AppColors.lightGrey,
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Divider(
                        thickness: 4,
                        height: 4,
                        color: indexPage >= 2
                            ? AppColors.primaryColor
                            : AppColors.lightGrey,
                      ),
                    ),
                  ),
                  Container(
                    height: 21,
                    width: 21,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: indexPage >= 2
                          ? AppColors.primaryColor
                          : AppColors.lightGrey,
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Divider(
                        thickness: 4,
                        height: 4,
                        color: indexPage >= 3
                            ? AppColors.primaryColor
                            : AppColors.lightGrey,
                      ),
                    ),
                  ),
                ],
              ),
              indexPage == 0
                  ? personalInformation()
                  : indexPage == 1
                      ? !lawyerBookAppointmentController
                              .getLawyerBookAppointmentLoader
                          ? Padding(
                              padding: EdgeInsets.fromLTRB(0, 250.h, 0, 250.h),
                              child: const CircularProgressIndicator(
                                backgroundColor: AppColors.transparent,
                                color: AppColors.primaryColor,
                              ),
                            )
                          : timeSchedule()
                      : indexPage == 2
                          ? paymentMethod()
                          : paymentMethod(),
            ],
          ),
        ),
      );
    });
  }

  // Review and Rating
  Widget reviewAndRating() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Rate This Lawyer",
            style: AppTextStyles.headingTextStyle4,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 30, 0, 18),
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
            decoration: BoxDecoration(
                color: AppColors.offWhite,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Communication",
                  style: AppTextStyles.subHeadingTextStyle1,
                ),
                Image.asset("assets/icons/star.png")
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
            decoration: BoxDecoration(
                color: AppColors.offWhite,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Professional Skills",
                  style: AppTextStyles.subHeadingTextStyle1,
                ),
                Image.asset("assets/icons/star.png")
              ],
            ),
          ),
          TextField(
            style: AppTextStyles.hintTextStyle1,
            maxLines: 5,
            // controller: controller,
            decoration: InputDecoration(
              hintText: "Write your Feedback here",
              hintStyle: AppTextStyles.hintTextStyle1,
              labelStyle: AppTextStyles.hintTextStyle1,
              contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
              isDense: true,
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ButtonWidgetOne(
              onTap: () {
                setState(() {
                  indexPage++;
                });
              },
              buttonText: "Continue",
              buttonTextStyle: AppTextStyles.bodyTextStyle8,
              borderRadius: 10,
              buttonColor: AppColors.primaryColor),
        ],
      ),
    );
  }

  // Payment Complete Thank You
  Widget paymentThankYou() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
      child: Column(
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
                const Text(
                  "For your payment 50",
                  style: AppTextStyles.bodyTextStyle2,
                ),
                const SizedBox(height: 36),
              ],
            ),
          ),
          const SizedBox(height: 36),
          Text(
            "Your Video Call Starts",
            style: AppTextStyles.bodyTextStyle2,
          ),
          const SizedBox(height: 8),
          Text(
            "00:55",
            style: AppTextStyles.bodyTextStyle9,
          ),
          const SizedBox(height: 36),
          ButtonWidgetOne(
              onTap: () {
                setState(() {
                  indexPage++;
                });
              },
              buttonText: "Try Again",
              buttonTextStyle: AppTextStyles.bodyTextStyle8,
              borderRadius: 10,
              buttonColor: AppColors.primaryColor),
        ],
      ),
    );
  }

// Payment Method
  Widget paymentMethod() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Choose your Payment Method",
            style: AppTextStyles.headingTextStyle4,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
            decoration: BoxDecoration(
              gradient: AppColors.gradientThree,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total you have to pay: ",
                  style: AppTextStyles.subHeadingTextStyle1,
                ),
                Text(
                  "\$ ${Get.find<LawyerAppointmentScheduleController>().getLawyerAppointmentScheduleModel.data!.schedule!.fee!}",
                  style: AppTextStyles.subHeadingTextStyle2,
                )
              ],
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.white, //background color of dropdown button
              border: Border.all(
                  color: AppColors.primaryColor,
                  width: 1), //border of dropdown button
              borderRadius:
                  BorderRadius.circular(10), //border raiuds of dropdown button
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.w, 5.h, 16.w, 5.h),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 1,
                  physics: const AlwaysScrollableScrollPhysics(),
                  // padding: const EdgeInsets.only(top: 18),
                  itemBuilder: (context, index) {
                    return DropdownButtonHideUnderline(
                      child: DropdownButtonFormField(
                        hint: const Text(
                          'Please Choose Payment Method',
                          style: AppTextStyles.bodyTextStyle11,
                        ), // Not necessary for Option 1
                        value: selectedPaymentGateway,

                        items: Get.find<PaymentGatewaysController>()
                            .getPaymentGatewaysModel
                            .data!
                            .map((gatewaysName) {
                          return DropdownMenuItem(
                            value: gatewaysName.code,
                            child: DropdownMenuItem(
                              child: Row(
                                children: [
                                  Image.network(
                                    "$mediaUrl${gatewaysName.image!}",
                                    height: 35.h,
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Text(gatewaysName.name!,
                                      style: AppTextStyles.bodyTextStyle11),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedPaymentGateway = newValue;

                            print(
                                "GATEWAYS SELECTED NAME ${selectedPaymentGateway}");
                          });
                        },
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.secondaryColor,
                        ),
                        iconEnabledColor: Colors.white, //Icon color
                        style: AppTextStyles.subHeadingTextStyle1,
                        dropdownColor:
                            AppColors.white, //dropdown background color
                        isExpanded: true, //make true to make width 100%
                      ),
                    );
                  }),
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidgetOne(
                  onTap: () {
                    // Book Appointment API Make Payment
                    postMethod(
                        context,
                        customerBookAppointment,
                        {
                          "lawyer_id": Get.find<GeneralController>()
                              .selectedLawyerForView
                              .id,
                          "question":
                              Get.find<LawyerAppointmentScheduleController>()
                                  .liveChatQuestionFieldController
                                  .text,
                          "appointment_type_id":
                              Get.find<LawyerAppointmentScheduleController>()
                                  .getLawyerAppointmentScheduleModel
                                  .data!
                                  .schedule!
                                  .appointmentTypeId!
                                  .toInt(),
                          "date": selectedDate.toString(),
                          "appointment_schedule_id":
                              Get.find<LawyerAppointmentScheduleController>()
                                  .getLawyerAppointmentScheduleModel
                                  .data!
                                  .schedule!
                                  .id!
                                  .toInt(),
                          "appointment_type":
                              Get.find<LawyerAppointmentScheduleController>()
                                  .getLawyerAppointmentScheduleModel
                                  .data!
                                  .schedule!
                                  .type,
                          "attachment": "12345",
                          "gateway": selectedPaymentGateway,
                        },
                        true,
                        makePaymentRepo);
                  },
                  buttonText: "Make Payment",
                  buttonTextStyle: AppTextStyles.bodyTextStyle16,
                  borderRadius: 10,
                  buttonColor: AppColors.primaryColor),
              Get.find<GetAllSettingsController>()
                          .getAllSettingsModel
                          .data!
                          .enableWalletSystem ==
                      "1"
                  ? Padding(
                      padding: EdgeInsets.only(left: 14.w),
                      child: ButtonWidgetOne(
                          onTap: () {
                            // Book Appointment API Make Payment via Wallet
                            postMethod(
                                context,
                                customerBookAppointment,
                                {
                                  "lawyer_id": Get.find<GeneralController>()
                                      .selectedLawyerForView
                                      .id,
                                  "question": Get.find<
                                                  LawyerAppointmentScheduleController>()
                                              .getLawyerAppointmentScheduleModel
                                              .data!
                                              .schedule!
                                              .appointmentType!
                                              .displayName ==
                                          "Video Call"
                                      ? Get.find<
                                              LawyerAppointmentScheduleController>()
                                          .videCallQuestionFieldController
                                          .text
                                      : Get.find<LawyerAppointmentScheduleController>()
                                                  .getLawyerAppointmentScheduleModel
                                                  .data!
                                                  .schedule!
                                                  .appointmentType!
                                                  .displayName ==
                                              "Audio Call"
                                          ? Get.find<
                                                  LawyerAppointmentScheduleController>()
                                              .audioCallQuestionFieldController
                                              .text
                                          : Get.find<
                                                  LawyerAppointmentScheduleController>()
                                              .videCallQuestionFieldController
                                              .text,
                                  "appointment_type_id": Get.find<
                                          LawyerAppointmentScheduleController>()
                                      .getLawyerAppointmentScheduleModel
                                      .data!
                                      .schedule!
                                      .appointmentTypeId!
                                      .toInt(),
                                  "date": selectedDate.toString(),
                                  "appointment_schedule_id": Get.find<
                                          LawyerAppointmentScheduleController>()
                                      .getLawyerAppointmentScheduleModel
                                      .data!
                                      .schedule!
                                      .id!
                                      .toInt(),
                                  "appointment_type": Get.find<
                                          LawyerAppointmentScheduleController>()
                                      .getLawyerAppointmentScheduleModel
                                      .data!
                                      .schedule!
                                      .type,
                                  "attachment": "12345",
                                  "gateway": "wallet",
                                },
                                true,
                                makePaymentViaWalletRepo);
                          },
                          buttonText: "Pay Via Wallet",
                          buttonTextStyle: AppTextStyles.bodyTextStyle16,
                          borderRadius: 10,
                          buttonColor: AppColors.primaryColor),
                    )
                  : SizedBox(),
            ],
          ),
        ],
      ),
    );
  }

// Time Schedule
  Widget timeSchedule() {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.w, 18.h, 18.w, 18.h),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 18.h),
              Row(
                children: [
                  Text(
                    "$dayToday / ",
                    textAlign: TextAlign.start,
                    style: AppTextStyles.subHeadingTextStyle1,
                  ),
                  Text(
                    "${selectedDate.toLocal()}".split(' ')[0],
                    textAlign: TextAlign.start,
                    style: AppTextStyles.subHeadingTextStyle1,
                  ),
                ],
              ),
              SizedBox(height: 18.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(0, 18.h, 0, 18.h),
                      decoration: BoxDecoration(
                          color: AppColors.offWhite.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.primaryColor)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Lawyer",
                            style: AppTextStyles.headingTextStyle2,
                          ),
                          Text(
                            Get.find<GeneralController>()
                                .selectedLawyerForView
                                .name!,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.subHeadingTextStyle1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(0, 18.h, 0, 18.h),
                      decoration: BoxDecoration(
                          color: AppColors.offWhite.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.primaryColor)),
                      child: Column(
                        children: [
                          Text(
                            "\$ ${Get.find<LawyerAppointmentScheduleController>().getLawyerAppointmentScheduleModel.data!.schedule!.fee!}",
                            style: AppTextStyles.headingTextStyle2,
                          ),
                          Text(
                            "${Get.find<LawyerAppointmentScheduleController>().getLawyerAppointmentScheduleModel.data!.schedule!.appointmentType!.displayName} Fee",
                            style: AppTextStyles.subHeadingTextStyle1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              ButtonWidgetOne(
                  onTap: () {
                    setState(() {
                      indexPage++;
                    });
                  },
                  buttonText: "Continue",
                  buttonTextStyle: AppTextStyles.bodyTextStyle8,
                  borderRadius: 10,
                  buttonColor: AppColors.primaryColor),
            ],
          ),
        ],
      ),
    );
  }

// Personal Information
  Widget personalInformation() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Enter Your Information",
            style: AppTextStyles.headingTextStyle4,
          ),
          const SizedBox(height: 18),
          TextField(
            style: AppTextStyles.hintTextStyle1,
            maxLines: 5,
            controller: Get.find<LawyerAppointmentScheduleController>()
                .liveChatQuestionFieldController,
            decoration: InputDecoration(
              hintText: "Write your Question here",
              hintStyle: AppTextStyles.hintTextStyle1,
              labelStyle: AppTextStyles.hintTextStyle1,
              contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
              isDense: true,
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "Do you have image with you?",
            style: AppTextStyles.subHeadingTextStyle1,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: RadioListTile(
                  title: const Text(
                    "No",
                    style: AppTextStyles.bodyTextStyle7,
                  ),
                  activeColor: AppColors.primaryColor,
                  selected: true,
                  value: "no",
                  groupValue: values,
                  onChanged: (value) {
                    setState(() {
                      values = value.toString();
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile(
                  title: const Text(
                    "Yes",
                    style: AppTextStyles.bodyTextStyle7,
                  ),
                  activeColor: AppColors.primaryColor,
                  value: "yes",
                  groupValue: values,
                  onChanged: (value) {
                    setState(() {
                      values = value.toString();
                    });
                  },
                ),
              ),
            ],
          ),
          values == 'no'
              ? Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 24),
                )
              : Container(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 24),
                  decoration: BoxDecoration(
                      color: AppColors.offWhite,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.primaryColor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Upload your Image",
                        style: AppTextStyles.buttonTextStyle7,
                      ),
                      const SizedBox(width: 10),
                      Image.asset("assets/icons/Upload.png")
                    ],
                  ),
                ),
          ButtonWidgetOne(
              onTap: () {
                setState(() {
                  indexPage++;
                });
              },
              buttonText: "Continue",
              buttonTextStyle: AppTextStyles.bodyTextStyle8,
              borderRadius: 10,
              buttonColor: AppColors.primaryColor),
        ],
      ),
    );
  }

  /// Returns the next button.
  Widget nextButton() {
    return ElevatedButton(
      onPressed: () {
        // Increment activeStep, when the next button is tapped. However, check for upper bound.
        if (activeStep < upperBound) {
          setState(() {
            activeStep++;
          });
        }
      },
      child: const Text('Next'),
    );
  }

  /// Returns the previous button.
  Widget previousButton() {
    return ElevatedButton(
      onPressed: () {
        // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
        if (activeStep > 0) {
          setState(() {
            activeStep--;
          });
        }
      },
      child: const Text('Prev'),
    );
  }

  Widget header() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              headerText(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Returns the header text based on the activeStep.
  String headerText() {
    switch (activeStep) {
      case 1:
        return 'Preface';

      case 2:
        return 'Table of Contents';

      case 3:
        return 'About the Author';

      case 4:
        return 'Publisher Information';

      case 5:
        return 'Reviews';

      case 6:
        return 'Chapters #1';

      default:
        return 'Introduction';
    }
  }
}
