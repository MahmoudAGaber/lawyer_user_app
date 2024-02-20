import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lawyer_consultant/src/controllers/all_settings_controller.dart';
import 'package:lawyer_consultant/src/controllers/payment_gateways_controller.dart';
import 'package:lawyer_consultant/src/repositories/get_payment_gateways_repo.dart';

import 'package:lawyer_consultant/src/widgets/button_widget.dart';
import 'package:resize/resize.dart';

import '../api_services/get_service.dart';
import '../api_services/post_service.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../controllers/general_controller.dart';
import '../controllers/lawyer_book_appointment_controller.dart';
import '../controllers/make_payment_controller.dart';
import '../controllers/stripe_payment_controller.dart';
import '../localization/language_constraints.dart';
import '../repositories/lawyer_book_appointment_repo.dart';

import '../repositories/make_payment_repo.dart';
import '../widgets/appbar_widget.dart';

class CallAppointmentScreen extends StatefulWidget {
  // final num? appointmentTypeId;
  const CallAppointmentScreen({
    super.key,
    // this.appointmentTypeId,
  });

  @override
  State<CallAppointmentScreen> createState() => _CallAppointmentScreenState();
}

class _CallAppointmentScreenState extends State<CallAppointmentScreen> {
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
  var scheduleSlotId;

  dynamic selectedPaymentGateway;

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor, // <-- SEE HERE
              onPrimary: AppColors.black, // <-- SEE HERE
              onSurface: AppColors.black, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: AppTextStyles.bodyTextStyle2,
                backgroundColor: AppColors.black, // button text color
              ),
            ),
            textTheme: const TextTheme(
              headline5:
                  AppTextStyles.bodyTextStyle2, // Selected Date landscape
              headline6: AppTextStyles.bodyTextStyle2, // Selected Date portrait
              overline: AppTextStyles.headingTextStyle4, // Title - SELECT DATE
              bodyText1: AppTextStyles.bodyTextStyle2, // year gridbview picker
              subtitle1: AppTextStyles.bodyTextStyle2, // input
              subtitle2: AppTextStyles.bodyTextStyle2, // month/year picker
              caption: AppTextStyles.bodyTextStyle2, // days
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        // selectedDate = formattedDate;
        getMethod(
            context,
            '$getLawyerBookAppointment${Get.find<GeneralController>().selectedLawyerForView.userName}/book_appointment',
            {"appointment_type_id": appointmentTypeId, "date": selectedDate},
            false,
            getLawyerBookAppointmentRepo);
      });
    }
  }

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
          child: lawyerBookAppointmentController.getLawyerBookAppointmentLoader
              ? lawyerBookAppointmentController
                          .getLawyerAppointmentScheduleModel.data!.schedule !=
                      null
                  ? Column(
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
                                        padding: EdgeInsets.fromLTRB(
                                            0, 250.h, 0, 250.h),
                                        child: const CircularProgressIndicator(
                                          backgroundColor:
                                              AppColors.transparent,
                                          color: AppColors.primaryColor,
                                        ),
                                      )
                                    : timeSchedule()
                                : indexPage == 2
                                    ? paymentMethod()
                                    : paymentMethod(),
                      ],
                    )
                  : Padding(
                      padding: EdgeInsets.fromLTRB(0, 100.h, 0, 100.h),
                      child:  Center(
                        child: Text(
                          getTranslated("noDataFound",context),
                          style: AppTextStyles.bodyTextStyle10,
                        ),
                      ),
                    )
              : Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 100.h, 0, 100.h),
                    child: const CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  ),
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
                          "question": Get.find<
                                          LawyerAppointmentScheduleController>()
                                      .getLawyerAppointmentScheduleModel
                                      .data!
                                      .schedule!
                                      .appointmentType!
                                      .displayName ==
                                  "Video Call"
                              ? Get.find<LawyerAppointmentScheduleController>()
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
                  : SizedBox()
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Select Date for Book Appointment",
                style: AppTextStyles.headingTextStyle4,
              ),
              SizedBox(width: 18.w),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: Container(
                  padding: EdgeInsets.fromLTRB(8.w, 4.h, 8.w, 4.h),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(4)),
                  child: Row(
                    children: [
                      const Text(
                        "Date",
                        style: AppTextStyles.buttonTextStyle2,
                      ),
                      SizedBox(width: 4.w),
                      Image.asset(
                        "assets/icons/Date_range.png",
                        height: 22.h,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Get.find<LawyerAppointmentScheduleController>()
                      .getLawyerAppointmentScheduleModel
                      .data!
                      .schedule ==
                  null
              ? Padding(
                  padding: EdgeInsets.fromLTRB(0, 250.h, 0, 250.h),
                  child: const Text(
                    "No Schedule Found",
                    style: AppTextStyles.bodyTextStyle10,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 18.h),
                    Divider(
                        thickness: 1.h,
                        height: 1.h,
                        color: AppColors.lightGrey),
                    SizedBox(height: 18.h),
                    Row(
                      children: [
                        Text(
                          "${Get.find<LawyerAppointmentScheduleController>().getLawyerAppointmentScheduleModel.data!.schedule!.day!.capitalizeFirst!} / ",
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
                    Wrap(
                      children: [
                        GridView.builder(
                          itemCount:
                              Get.find<LawyerAppointmentScheduleController>()
                                  .getLawyerAppointmentScheduleModel
                                  .data!
                                  .schedule!
                                  .scheduleSlots!
                                  .length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 2 / 0.75,
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              decoration: BoxDecoration(
                                  gradient: value == index
                                      ? AppColors.gradientOne
                                      : AppColors.gradientTwo,
                                  border: Border.all(
                                    color: AppColors.primaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                    splashColor: AppColors.transparent,
                                    highlightColor: AppColors.transparent,
                                    canvasColor: AppColors.transparent),
                                child: ChoiceChip(
                                  labelPadding:
                                      EdgeInsets.fromLTRB(3.w, 0, 3.w, 0),
                                  visualDensity: const VisualDensity(
                                      horizontal: -1, vertical: -4),
                                  // label: const Text('08:00 - 08:30'),
                                  label: Text(
                                      '${Get.find<LawyerAppointmentScheduleController>().getLawyerAppointmentScheduleModel.data!.schedule!.scheduleSlots![index].startTime} - ${Get.find<LawyerAppointmentScheduleController>().getLawyerAppointmentScheduleModel.data!.schedule!.scheduleSlots![index].endTime}'),
                                  labelStyle: value == index
                                      ? AppTextStyles.chipsTextStyle2
                                      : AppTextStyles.chipsTextStyle1,
                                  backgroundColor: AppColors.transparent,
                                  selectedColor: AppColors.transparent,
                                  disabledColor: AppColors.black,
                                  surfaceTintColor: AppColors.offWhite,
                                  showCheckmark: false,
                                  selected: value == index,
                                  side: const BorderSide(
                                      color: AppColors.transparent),
                                  onSelected: (bool selected) {
                                    setState(() {
                                      value = selected ? index : null;
                                      selectedSlot =
                                          "${Get.find<LawyerAppointmentScheduleController>().getLawyerAppointmentScheduleModel.data!.schedule!.scheduleSlots!.elementAt(value!).startTime} - ${Get.find<LawyerAppointmentScheduleController>().getLawyerAppointmentScheduleModel.data!.schedule!.scheduleSlots!.elementAt(value!).endTime}";
                                      print("$selectedSlot SELECTEDSLOT");
                                      print("$selectedDate SELECTEDDATE");
                                      scheduleSlotId = Get.find<
                                              LawyerAppointmentScheduleController>()
                                          .getLawyerAppointmentScheduleModel
                                          .data!
                                          .schedule!
                                          .scheduleSlots![index]
                                          .id;
                                      print("${scheduleSlotId} ScheduleID");
                                    });
                                  },
                                ),
                              ),
                            );
                          },
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
                                border:
                                    Border.all(color: AppColors.primaryColor)),
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
                                border:
                                    Border.all(color: AppColors.primaryColor)),
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
                    SizedBox(height: 12.h),
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
                                border:
                                    Border.all(color: AppColors.primaryColor)),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Date",
                                    style: AppTextStyles.headingTextStyle2,
                                  ),
                                  Text(
                                    "${selectedDate.toLocal()}".split(' ')[0],
                                    style: AppTextStyles.subHeadingTextStyle1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 18.w),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.fromLTRB(0, 18.h, 0, 18.h),
                            decoration: BoxDecoration(
                                color: AppColors.offWhite.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: AppColors.primaryColor)),
                            child: Column(
                              children: [
                                const Text(
                                  "Time",
                                  style: AppTextStyles.headingTextStyle2,
                                ),
                                Text(
                                  value != null ? "$selectedSlot" : "-",
                                  style: AppTextStyles.subHeadingTextStyle1,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     const Text(
                    //       "Afternoon",
                    //       style: AppTextStyles.headingTextStyle4,
                    //     ),
                    //     const SizedBox(width: 18),
                    //     Image.asset("assets/icons/🦆 icon _Sun_.png")
                    //   ],
                    // ),
                    // const SizedBox(height: 18),
                    // Wrap(
                    //   children: [
                    //     GridView.builder(
                    //       itemCount: 6,
                    //       shrinkWrap: true,
                    //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //           childAspectRatio: 2 / 0.8,
                    //           crossAxisCount: 3,
                    //           crossAxisSpacing: 6,
                    //           mainAxisSpacing: 6),
                    //       itemBuilder: (BuildContext context, int index) {
                    //         return Container(
                    //           decoration: BoxDecoration(
                    //               gradient: value == index
                    //                   ? AppColors.gradientOne
                    //                   : AppColors.gradientTwo,
                    //               border: Border.all(
                    //                 color: AppColors.primaryColor,
                    //               ),
                    //               borderRadius: BorderRadius.circular(8)),
                    //           child: Theme(
                    //             data: Theme.of(context).copyWith(
                    //                 splashColor: AppColors.transparent,
                    //                 highlightColor: AppColors.transparent,
                    //                 canvasColor: AppColors.transparent),
                    //             child: ChoiceChip(
                    //               visualDensity:
                    //                   const VisualDensity(horizontal: -1, vertical: -4),
                    //               label: const Text('08:00 - 08:30'),
                    //               labelStyle: value == index
                    //                   ? AppTextStyles.chipsTextStyle2
                    //                   : AppTextStyles.chipsTextStyle1,
                    //               backgroundColor: AppColors.transparent,
                    //               selectedColor: AppColors.transparent,
                    //               disabledColor: AppColors.offWhite,
                    //               surfaceTintColor: AppColors.offWhite,
                    //               selected: value == index,
                    //               onSelected: (bool selected) {
                    //                 setState(() {
                    //                   value = selected ? index : null;
                    //                 });
                    //               },
                    //             ),
                    //           ),
                    //         );
                    //       },
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(height: 18),
                    // Row(
                    //   children: [
                    //     const Text(
                    //       "Evening",
                    //       style: AppTextStyles.headingTextStyle4,
                    //     ),
                    //     const SizedBox(width: 18),
                    //     Image.asset("assets/icons/🦆 icon _Sun_.png")
                    //   ],
                    // ),
                    // const SizedBox(height: 18),
                    // Wrap(
                    //   children: [
                    //     GridView.builder(
                    //       itemCount: 6,
                    //       shrinkWrap: true,
                    //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //           childAspectRatio: 2 / 0.8,
                    //           crossAxisCount: 3,
                    //           crossAxisSpacing: 6,
                    //           mainAxisSpacing: 6),
                    //       itemBuilder: (BuildContext context, int index) {
                    //         return Container(
                    //           decoration: BoxDecoration(
                    //               gradient: value == index
                    //                   ? AppColors.gradientOne
                    //                   : AppColors.gradientTwo,
                    //               border: Border.all(
                    //                 color: AppColors.primaryColor,
                    //               ),
                    //               borderRadius: BorderRadius.circular(8)),
                    //           child: Theme(
                    //             data: Theme.of(context).copyWith(
                    //                 splashColor: AppColors.transparent,
                    //                 highlightColor: AppColors.transparent,
                    //                 canvasColor: AppColors.transparent),
                    //             child: ChoiceChip(
                    //               visualDensity:
                    //                   const VisualDensity(horizontal: -1, vertical: -4),
                    //               label: const Text('08:00 - 08:30'),
                    //               labelStyle: value == index
                    //                   ? AppTextStyles.chipsTextStyle2
                    //                   : AppTextStyles.chipsTextStyle1,
                    //               backgroundColor: AppColors.transparent,
                    //               selectedColor: AppColors.transparent,
                    //               disabledColor: AppColors.offWhite,
                    //               surfaceTintColor: AppColors.offWhite,
                    //               selected: value == index,
                    //               onSelected: (bool selected) {
                    //                 setState(() {
                    //                   value = selected ? index : null;
                    //                 });
                    //               },
                    //             ),
                    //           ),
                    //         );
                    //       },
                    //     ),
                    //   ],
                    // ),
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
                        .getLawyerAppointmentScheduleModel
                        .data!
                        .schedule!
                        .appointmentTypeId! ==
                    1
                ? Get.find<LawyerAppointmentScheduleController>()
                    .videCallQuestionFieldController
                : Get.find<LawyerAppointmentScheduleController>()
                            .getLawyerAppointmentScheduleModel
                            .data!
                            .schedule!
                            .appointmentTypeId! ==
                        2
                    ? Get.find<LawyerAppointmentScheduleController>()
                        .audioCallQuestionFieldController
                    : Get.find<LawyerAppointmentScheduleController>()
                        .videCallQuestionFieldController,
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
}
