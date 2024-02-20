import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawyer_consultant/src/models/customer_appointment_history_model.dart';
import 'package:resize/resize.dart';

import '../api_services/get_service.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../controllers/customer_appointment_history_controller.dart';
import '../controllers/general_controller.dart';
import '../localization/language_constraints.dart';
import '../repositories/customer_appointment_history_repo.dart';
import '../routes.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/custom_skeleton_loader.dart';
import 'appointment_detail_screen.dart';

class AppointmentHistoryScreen extends StatefulWidget {
  const AppointmentHistoryScreen({super.key});

  @override
  State<AppointmentHistoryScreen> createState() =>
      _AppointmentHistoryScreenState();
}

class _AppointmentHistoryScreenState extends State<AppointmentHistoryScreen> {
  final logic = Get.put(CustomerAppointmentHistoryController());

  List<CustomerAppointmentHistoryModel>? pendingList = [];
  String? fromBookAppointment = Get.parameters["fromBookAppointment"];

  @override
  void initState() {
    super.initState();
    getMethod(context, "$getCustomerAppointmentHistory?page=1", null, true,
        getAllCustomerAppointmentHistoryRepo);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerAppointmentHistoryController>(
        builder: (customerAppointmentHistoryController) {
      return GetBuilder<GeneralController>(builder: (generalController) {
        return DefaultTabController(
          length: 4, // length of tabs
          initialIndex: 0,
          child: Scaffold(
            backgroundColor: AppColors.white,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(56),
              child: AppBarWidget(
                richTextSpan:  TextSpan(
                  text: getTranslated('appointmentHistory',context),
                  style: AppTextStyles.appbarTextStyle2,
                  children: <TextSpan>[],
                ),
                leadingIcon: "assets/icons/Expand_left.png",
                leadingOnTap: () {
                  fromBookAppointment == "Yes"
                      ? Get.toNamed(PageRoutes.homeScreen)
                      : Get.back();
                },
              ),
            ),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Theme(
                    data: ThemeData()
                        .copyWith(dividerColor: AppColors.primaryColor),
                    child: TabBar(
                      labelColor: AppColors.white,
                      unselectedLabelColor: AppColors.secondaryColor,
                      dividerColor: AppColors.transparent,
                      padding: const EdgeInsets.fromLTRB(3, 6, 3, 6),
                      indicatorPadding: const EdgeInsets.fromLTRB(-6, 4, -6, 4),
                      labelPadding: EdgeInsets.zero,
                      labelStyle: AppTextStyles.buttonTextStyle2,
                      unselectedLabelStyle: AppTextStyles.buttonTextStyle7,
                      indicator: BoxDecoration(
                          gradient: AppColors.gradientOne,
                          borderRadius: BorderRadius.circular(10)),
                      tabs: const [
                        Tab(text: 'All'),
                        Tab(text: 'Pending'),
                        Tab(text: 'Accepted'),
                        Tab(text: 'Completed'),
                      ],
                    ),
                  ),
                  !customerAppointmentHistoryController
                          .allCustomerAppointmentHistoryLoader
                      ? Expanded(
                          child: CustomVerticalSkeletonLoader(
                            height: 200.h,
                            highlightColor: AppColors.grey,
                            seconds: 2,
                            totalCount: 5,
                            width: 140.w,
                          ),
                        )
                      : Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: AppColors.primaryColor,
                                        width: 1))),
                            child: TabBarView(children: <Widget>[
                              // All Appointment History
                              ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: customerAppointmentHistoryController
                                    .customerAllAppointmentHistoryListForPagination
                                    .length,
                                physics: const AlwaysScrollableScrollPhysics(),
                                padding: const EdgeInsets.only(top: 18),
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        18, 0, 18, 18),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              12, 12, 12, 12),
                                          // margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                                          decoration: const BoxDecoration(
                                            color: AppColors.offWhite,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              topLeft: Radius.circular(10),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Row(
                                                children: [
                                                  // ClipRRect(
                                                  //   borderRadius:
                                                  //       BorderRadius.circular(
                                                  //           10),
                                                  //   child: const Image(
                                                  //     image: AssetImage(
                                                  //         'assets/images/lawyer-image.png'),
                                                  //   ),
                                                  // ),
                                                  customerAppointmentHistoryController
                                                              .customerAllAppointmentHistoryListForPagination[
                                                                  index]
                                                              .lawyerImage ==
                                                          null
                                                      ? ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.r),
                                                          child: Image.asset(
                                                            scale: 4.h,
                                                            'assets/images/lawyer-image.png',
                                                            fit: BoxFit.cover,
                                                            height: 110.h,
                                                            width: 120.w,
                                                          ))
                                                      : ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.r),
                                                          child: Image.network(
                                                            scale: 4.h,
                                                            '$mediaUrl${customerAppointmentHistoryController.customerAllAppointmentHistoryListForPagination[index].lawyerImage!}',
                                                            fit: BoxFit.cover,
                                                            height: 110.h,
                                                            width: 120.w,
                                                          ),
                                                        ),
                                                  SizedBox(
                                                    width: 12.w,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Flexible(
                                                              child: Text(
                                                                // "Jhon Doe",
                                                                customerAppointmentHistoryController
                                                                        .customerAllAppointmentHistoryListForPagination[
                                                                            index]
                                                                        .lawyerName ??
                                                                    "",
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: AppTextStyles
                                                                    .bodyTextStyle10,
                                                              ),
                                                            ),
                                                            Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      5,
                                                                      2,
                                                                      5,
                                                                      2),
                                                              decoration: BoxDecoration(
                                                                  color: customerAppointmentHistoryController.customerAllAppointmentHistoryListForPagination[index].appointmentStatusCode! == 1
                                                                      ? AppColors.primaryColor
                                                                      : customerAppointmentHistoryController.customerAllAppointmentHistoryListForPagination[index].appointmentStatusCode! == 5
                                                                          ? AppColors.green.withOpacity(0.5)
                                                                          : customerAppointmentHistoryController.customerAllAppointmentHistoryListForPagination[index].appointmentStatusCode! == 2
                                                                              ? AppColors.orange.withOpacity(0.5)
                                                                              : AppColors.primaryColor,
                                                                  borderRadius: BorderRadius.circular(5)),
                                                              child: Text(
                                                                // "Pending",
                                                                customerAppointmentHistoryController
                                                                    .customerAllAppointmentHistoryListForPagination[
                                                                        index]
                                                                    .appointmentStatusName!,
                                                                style: AppTextStyles
                                                                    .bodyTextStyle4,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 8,
                                                        ),
                                                        const Text(
                                                          "Education Law Specialist",
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: AppTextStyles
                                                              .bodyTextStyle3,
                                                        ),
                                                        const SizedBox(
                                                          height: 8,
                                                        ),
                                                        const Text(
                                                          'LLB | Master of Dispute Resolution | Master of Legal Studies | Master of Laws',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: AppTextStyles
                                                              .bodyTextStyle3,
                                                        ),
                                                        const SizedBox(
                                                          height: 8,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            generalController
                                                                .updateSelectedAppointmentHistoryForView(
                                                                    customerAppointmentHistoryController
                                                                            .customerAllAppointmentHistoryListForPagination[
                                                                        index]);
                                                            Get.toNamed(PageRoutes
                                                                .appointmentHistoryDetailScreen);
                                                          },
                                                          child: const Text(
                                                            'View Details',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: AppTextStyles
                                                                .bodyTextStyle1,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 8, 20, 8),
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                              ),
                                              gradient: AppColors.gradientOne),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                      "assets/icons/Date_range_light.png"),
                                                  SizedBox(width: 5.w),
                                                  Text(
                                                    // "Mon, 28th March, 2023",
                                                    customerAppointmentHistoryController
                                                        .customerAllAppointmentHistoryListForPagination[
                                                            index]
                                                        .date!,
                                                    style: AppTextStyles
                                                        .bodyTextStyle6,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                      "assets/icons/Time.png"),
                                                  SizedBox(width: 5.w),
                                                  Text(
                                                    customerAppointmentHistoryController
                                                            .customerAllAppointmentHistoryListForPagination[
                                                                index]
                                                            .startTime ??
                                                        "",
                                                    style: AppTextStyles
                                                        .bodyTextStyle6,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  customerAppointmentHistoryController
                                                              .customerAllAppointmentHistoryListForPagination[
                                                                  index]
                                                              .appointmentTypeId! ==
                                                          1
                                                      ? Image.asset(
                                                          "assets/icons/🦆 icon _Video_.png",
                                                          height: 16.h,
                                                        )
                                                      : customerAppointmentHistoryController
                                                                  .customerAllAppointmentHistoryListForPagination[
                                                                      index]
                                                                  .appointmentTypeId! ==
                                                              2
                                                          ? Image.asset(
                                                              "assets/icons/🦆 icon _Volume Up_.png",
                                                              height: 16.h,
                                                            )
                                                          : customerAppointmentHistoryController
                                                                      .customerAllAppointmentHistoryListForPagination[
                                                                          index]
                                                                      .appointmentTypeId! ==
                                                                  3
                                                              ? Image.asset(
                                                                  "assets/icons/🦆 icon _comments_.png",
                                                                  height: 16.h,
                                                                )
                                                              : Container(),
                                                  SizedBox(width: 5.w),
                                                  Text(
                                                    // "Video Call",
                                                    customerAppointmentHistoryController
                                                        .customerAllAppointmentHistoryListForPagination[
                                                            index]
                                                        .appointmentTypeName!,
                                                    style: AppTextStyles
                                                        .bodyTextStyle6,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              // Pending Appointment History
                              appointmentHistoryWidget(
                                  1,
                                  customerAppointmentHistoryController,
                                  generalController),
                              // Accepted Appointment History
                              appointmentHistoryWidget(
                                  2,
                                  customerAppointmentHistoryController,
                                  generalController),
                              // Completed Appointment History
                              appointmentHistoryWidget(
                                  5,
                                  customerAppointmentHistoryController,
                                  generalController),
                            ]),
                          ),
                        )
                ]),
          ),
        );
      });
    });
  }

  // Appointment History
  Widget appointmentHistoryWidget(
      int statusCode,
      CustomerAppointmentHistoryController customerAppointmentHistoryController,
      GeneralController generalController) {
    return customerAppointmentHistoryController
            .customerAllAppointmentHistoryListForPagination
            .where((i) => i.appointmentStatusCode == statusCode)
            .toList()
            .isNotEmpty
        ? ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            // ignore: iterable_contains_unrelated_type
            itemCount: customerAppointmentHistoryController
                .customerAllAppointmentHistoryListForPagination
                .where((i) => i.appointmentStatusCode == statusCode)
                .toList()
                .length,
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: 18),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                      // margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      decoration: const BoxDecoration(
                        color: AppColors.offWhite,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              // ClipRRect(
                              //   borderRadius:
                              //       BorderRadius.circular(
                              //           10),
                              //   child: const Image(
                              //     image: AssetImage(
                              //         'assets/images/lawyer-image.png'),
                              //   ),
                              // ),
                              customerAppointmentHistoryController
                                          .customerAllAppointmentHistoryListForPagination[
                                              index]
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
                                        '$mediaUrl${customerAppointmentHistoryController.customerAllAppointmentHistoryListForPagination[index].lawyerImage!}',
                                        fit: BoxFit.cover,
                                        height: 110.h,
                                        width: 120.w,
                                      ),
                                    ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            // "Jhon Doe",
                                            customerAppointmentHistoryController
                                                    .customerAllAppointmentHistoryListForPagination
                                                    .where((i) =>
                                                        i.appointmentStatusCode ==
                                                        statusCode)
                                                    .toList()[index]
                                                    .lawyerName ??
                                                "",
                                            textAlign: TextAlign.start,
                                            style:
                                                AppTextStyles.bodyTextStyle10,
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 2, 5, 2),
                                          decoration: BoxDecoration(
                                              color: customerAppointmentHistoryController
                                                          .customerAllAppointmentHistoryListForPagination
                                                          .where((i) =>
                                                              i.appointmentStatusCode ==
                                                              statusCode)
                                                          .toList()[index]
                                                          .appointmentStatusCode! ==
                                                      1
                                                  ? AppColors.primaryColor
                                                  : customerAppointmentHistoryController
                                                              .customerAllAppointmentHistoryListForPagination
                                                              .where((i) =>
                                                                  i.appointmentStatusCode ==
                                                                  statusCode)
                                                              .toList()[index]
                                                              .appointmentStatusCode! ==
                                                          5
                                                      ? AppColors.green
                                                          .withOpacity(0.5)
                                                      : customerAppointmentHistoryController
                                                                  .customerAllAppointmentHistoryListForPagination
                                                                  .where((i) =>
                                                                      i.appointmentStatusCode ==
                                                                      statusCode)
                                                                  .toList()[index]
                                                                  .appointmentStatusCode! ==
                                                              2
                                                          ? AppColors.orange.withOpacity(0.5)
                                                          : AppColors.primaryColor,
                                              borderRadius: BorderRadius.circular(5)),
                                          child: Text(
                                            // statusCode,
                                            customerAppointmentHistoryController
                                                .customerAllAppointmentHistoryListForPagination
                                                .where((i) =>
                                                    i.appointmentStatusCode ==
                                                    statusCode)
                                                .toList()[index]
                                                .appointmentStatusName!,
                                            style: AppTextStyles.bodyTextStyle4,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 24.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        generalController
                                            .updateSelectedAppointmentHistoryForView(
                                                customerAppointmentHistoryController
                                                    .customerAllAppointmentHistoryListForPagination
                                                    .where((i) =>
                                                        i.appointmentStatusCode ==
                                                        statusCode)
                                                    .toList()[index]);
                                        Get.toNamed(PageRoutes
                                            .appointmentHistoryDetailScreen);
                                      },
                                      child: const Text(
                                        'View Details',
                                        textAlign: TextAlign.start,
                                        style: AppTextStyles.bodyTextStyle1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          gradient: AppColors.gradientOne),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/icons/Date_range_light.png"),
                              SizedBox(width: 5.w),
                              Text(
                                // "Mon, 28th March, 2023",
                                customerAppointmentHistoryController
                                    .customerAllAppointmentHistoryListForPagination
                                    .where((i) =>
                                        i.appointmentStatusCode == statusCode)
                                    .toList()[index]
                                    .date!,
                                style: AppTextStyles.bodyTextStyle6,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset("assets/icons/Time.png"),
                              SizedBox(width: 5.w),
                              Text(
                                customerAppointmentHistoryController
                                        .customerAllAppointmentHistoryListForPagination[
                                            index]
                                        .startTime ??
                                    "",
                                style: AppTextStyles.bodyTextStyle6,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              customerAppointmentHistoryController
                                          .customerAllAppointmentHistoryListForPagination
                                          .where((i) =>
                                              i.appointmentStatusCode ==
                                              statusCode)
                                          .toList()[index]
                                          .appointmentTypeId! ==
                                      1
                                  ? Image.asset(
                                      "assets/icons/🦆 icon _Video_.png",
                                      height: 16.h,
                                    )
                                  : customerAppointmentHistoryController
                                              .customerAllAppointmentHistoryListForPagination
                                              .where((i) =>
                                                  i.appointmentStatusCode ==
                                                  statusCode)
                                              .toList()[index]
                                              .appointmentTypeId! ==
                                          2
                                      ? Image.asset(
                                          "assets/icons/🦆 icon _Volume Up_.png",
                                          height: 16.h,
                                        )
                                      : customerAppointmentHistoryController
                                                  .customerAllAppointmentHistoryListForPagination
                                                  .where((i) =>
                                                      i.appointmentStatusCode ==
                                                      statusCode)
                                                  .toList()[index]
                                                  .appointmentTypeId! ==
                                              3
                                          ? Image.asset(
                                              "assets/icons/🦆 icon _comments_.png",
                                              height: 16.h,
                                            )
                                          : Container(),
                              SizedBox(width: 5.w),
                              Text(
                                // "Video Call",
                                customerAppointmentHistoryController
                                    .customerAllAppointmentHistoryListForPagination
                                    .where((i) =>
                                        i.appointmentStatusCode == statusCode)
                                    .toList()[index]
                                    .appointmentTypeName!,
                                style: AppTextStyles.bodyTextStyle6,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        :  Center(
            child: Text(
              getTranslated("noDataFound",context),
              style: AppTextStyles.bodyTextStyle2,
            ),
          );
  }
}
