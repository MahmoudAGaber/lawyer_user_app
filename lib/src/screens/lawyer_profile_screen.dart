import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';
import 'package:url_launcher/url_launcher.dart';
import '../api_services/get_service.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../controllers/general_controller.dart';
import '../controllers/lawyer_appointment_types_controller.dart';
import '../controllers/lawyer_book_appointment_controller.dart';
import '../localization/language_constraints.dart';
import '../repositories/lawyer_appointment_types_repo.dart';
import '../routes.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/lawyer_broadcasts_list_widget.dart';
import '../widgets/lawyer_podcasts_list_widget.dart';
import '../widgets/lawyer_reviews_list_widget.dart';

class LawyerProfileScreen extends StatefulWidget {
  LawyerProfileScreen();

  @override
  State<LawyerProfileScreen> createState() => _LawyerProfileScreenState();
}

class _LawyerProfileScreenState extends State<LawyerProfileScreen> {
  final lawyerBookAppointmentlogic =
      Get.put(LawyerAppointmentScheduleController());
  final lawyerAppointmentTypeslogic =
      Get.put(LawyerAppointmentTypesController());
  @override
  void initState() {
    super.initState();
    // /isabellacarrington/appointment_types
    // Get Lawyer Appointment Types API Call
    print(
        "${Get.find<GeneralController>().selectedLawyerForView.userName} LawyerUsername");
    getMethod(
        context,
        '$getLawyerAppointmentTypes${Get.find<GeneralController>().selectedLawyerForView.userName}/appointment_types',
        null,
        false,
        getLawyerAppointmentTypesRepo);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(builder: (generalController) {
      return GetBuilder<LawyerAppointmentTypesController>(
          builder: (lawyerAppointmentTypesController) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: AppBarWidget(
              richTextSpan:  TextSpan(
                text: getTranslated('lawyerProfile',context),
                style: AppTextStyles.appbarTextStyle2,
                children: <TextSpan>[],
              ),
              leadingIcon: "assets/icons/Expand_left.png",
              leadingOnTap: () {
                Get.back();
              },
            ),
          ),
          body: !lawyerAppointmentTypesController.lawyerAppointmentTypesLoader
              ? const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: AppColors.transparent,
                    color: AppColors.primaryColor,
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                        margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                        decoration: BoxDecoration(
                            gradient: AppColors.gradientOne,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: generalController
                                              .selectedLawyerForView.image !=
                                          null
                                      ? Image(
                                          image: NetworkImage(
                                            "$mediaUrl${generalController.selectedLawyerForView.image}",
                                          ),
                                          height: 150.h,
                                        )
                                      : Image(
                                          image: const AssetImage(
                                              'assets/images/lawyer-image.png'),
                                          height: 150.h,
                                        ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        // "Jhon Doe",
                                        generalController
                                            .selectedLawyerForView.name
                                            .toString(),
                                        textAlign: TextAlign.start,
                                        style: AppTextStyles.bodyTextStyle5,
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                        width: 170.w,
                                        child: ListView(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          children: List.generate(
                                              generalController
                                                  .selectedLawyerForView
                                                  .lawyerCategories!
                                                  .length, (index1) {
                                            return Text(
                                              "${generalController.selectedLawyerForView.lawyerCategories![index1].name} | ",
                                              textAlign: TextAlign.start,
                                              style:
                                                  AppTextStyles.bodyTextStyle6,
                                            );
                                          }),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Row(
                                        children: [
                                          RatingBar.builder(
                                            initialRating: generalController
                                                .selectedLawyerForView.rating!
                                                .toDouble(),
                                            minRating: 1,
                                            itemSize: 15.h,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            ignoreGestures: true,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 0.0),
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (double value) {},
                                          ),
                                          SizedBox(width: 5.w),
                                          Text(
                                            // '4.5',
                                            "(${generalController.selectedLawyerForView.rating!})",
                                            textAlign: TextAlign.start,
                                            style: AppTextStyles.bodyTextStyle6,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        // 'jhondoe@gmail.com',
                                        "${generalController.selectedLawyerForView.userName}",
                                        textAlign: TextAlign.start,
                                        style: AppTextStyles.bodyTextStyle6,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () async {
                                              await launchUrl(Uri.parse(
                                                  "${generalController.selectedLawyerForView.lawyerSettings!.facebookUrl}"));
                                            },
                                            child: Image.asset(
                                                "assets/icons/🦆 icon _Facebook F_.png"),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              await launchUrl(Uri.parse(
                                                  "${generalController.selectedLawyerForView.lawyerSettings!.instagramUrl}"));
                                            },
                                            child: Image.asset(
                                                "assets/icons/🦆 icon _Instagram_.png"),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              await launchUrl(Uri.parse(
                                                  "${generalController.selectedLawyerForView.lawyerSettings!.twitterUrl}"));
                                            },
                                            child: Image.asset(
                                                "assets/icons/🦆 icon _Twitter_.png"),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            SizedBox(
                              height: 32.h,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: lawyerAppointmentTypesController
                                      .getLawyerAppointmentTypesModel
                                      .data!
                                      .length,
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ButtonWidgetTwo(
                                          borderRadius: 5,
                                          buttonColor: AppColors.gradientTwo,
                                          buttonIcon: lawyerAppointmentTypesController
                                                      .getLawyerAppointmentTypesModel
                                                      .data![index]
                                                      .id ==
                                                  1
                                              ? 'assets/icons/🦆 icon _Video_.png'
                                              : lawyerAppointmentTypesController
                                                          .getLawyerAppointmentTypesModel
                                                          .data![index]
                                                          .id ==
                                                      2
                                                  ? 'assets/icons/🦆 icon _Volume Up_.png'
                                                  : lawyerAppointmentTypesController
                                                              .getLawyerAppointmentTypesModel
                                                              .data![index]
                                                              .id ==
                                                          3
                                                      ? 'assets/icons/🦆 icon _comments_.png'
                                                      : '',
                                          buttonText:
                                              lawyerAppointmentTypesController
                                                  .getLawyerAppointmentTypesModel
                                                  .data![index]
                                                  .displayName
                                                  .toString(),
                                          buttonTextStyle:
                                              AppTextStyles.buttonTextStyle6,
                                          iconHeight: 17.h,
                                          onTap: Get.find<GeneralController>()
                                                      .storageBox
                                                      .read('authToken') !=
                                                  null
                                              ? () {
                                                  // Get.toNamed(PageRoutes
                                                  //     .videoCallAppointmentScreen);
                                                  lawyerAppointmentTypesController
                                                              .getLawyerAppointmentTypesModel
                                                              .data![index]
                                                              .id ==
                                                          1
                                                      ? Get.toNamed(
                                                          PageRoutes
                                                              .callAppointmentScreen,
                                                          parameters: {
                                                              "appointmentTypeId":
                                                                  lawyerAppointmentTypesController
                                                                      .getLawyerAppointmentTypesModel
                                                                      .data![
                                                                          index]
                                                                      .id!
                                                                      .toString(),
                                                              "screenTitle":
                                                                  "Video Call Appointment"
                                                            })
                                                      : lawyerAppointmentTypesController
                                                                  .getLawyerAppointmentTypesModel
                                                                  .data![index]
                                                                  .id ==
                                                              2
                                                          ? Get.toNamed(
                                                              PageRoutes
                                                                  .callAppointmentScreen,
                                                              parameters: {
                                                                  "appointmentTypeId": lawyerAppointmentTypesController
                                                                      .getLawyerAppointmentTypesModel
                                                                      .data![
                                                                          index]
                                                                      .id!
                                                                      .toString(),
                                                                  "screenTitle":
                                                                      "Audio Call Appointment"
                                                                })
                                                          : lawyerAppointmentTypesController
                                                                      .getLawyerAppointmentTypesModel
                                                                      .data![
                                                                          index]
                                                                      .id ==
                                                                  3
                                                              ? Get.toNamed(
                                                                  PageRoutes
                                                                      .chatAppointmentScreen,
                                                                  parameters: {
                                                                      "appointmentTypeId": lawyerAppointmentTypesController
                                                                          .getLawyerAppointmentTypesModel
                                                                          .data![
                                                                              index]
                                                                          .id!
                                                                          .toString(),
                                                                      "screenTitle":
                                                                          "Chat Appointment"
                                                                    })
                                                              : '';
                                                }
                                              : () {
                                                  generalController
                                                      .showMessageDialog(
                                                          context);
                                                },
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        )
                                      ],
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                      DefaultTabController(
                        length: 4, // length of tabs
                        initialIndex: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Theme(
                              data: ThemeData().copyWith(
                                  dividerColor: AppColors.primaryColor),
                              child: TabBar(
                                labelColor: AppColors.white,
                                unselectedLabelColor: AppColors.secondaryColor,
                                // dividerColor: AppColors.primaryColor,
                                padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                                indicatorPadding:
                                    const EdgeInsets.fromLTRB(-8, 4, -8, 4),
                                labelStyle: AppTextStyles.buttonTextStyle2,
                                unselectedLabelStyle:
                                    AppTextStyles.buttonTextStyle7,
                                indicator: BoxDecoration(
                                    gradient: AppColors.gradientOne,
                                    borderRadius: BorderRadius.circular(10)),
                                tabs:  [
                                  Tab(text: getTranslated('about',context)),
                                  Tab(text: getTranslated('reviews',context)),
                                  Tab(text: getTranslated('podcast',context)),
                                  Tab(text: getTranslated('broadcast',context)),
                                ],
                              ),
                            ),
                            Container(
                                height: 400,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: AppColors.primaryColor,
                                        width: 1),
                                  ),
                                ),
                                child: TabBarView(children: <Widget>[
                                  // About
                                  SingleChildScrollView(
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          18, 12, 18, 18),
                                      child: generalController
                                                  .selectedLawyerForView
                                                  .description !=
                                              null
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    ' ${getTranslated("about", context)} ${generalController.selectedLawyerForView.name}',
                                                    style: AppTextStyles
                                                        .bodyTextStyle2),
                                                SizedBox(height: 14.h),
                                                Text(
                                                    '${generalController.selectedLawyerForView.description}',
                                                    style: AppTextStyles
                                                        .bodyTextStyle7),
                                              ],
                                            )
                                          :  Center(
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 50, 0, 0),
                                                child: Text(
                                                  getTranslated("noDataFound",context),
                                                  style: AppTextStyles
                                                      .bodyTextStyle2,
                                                ),
                                              ),
                                            ),
                                    ),
                                  ),
                                  // Reviews
                                  LawyerReviewsListWidget(
                                    lawyerReviewsSlug:
                                        '${generalController.selectedLawyerForView.userName}',
                                  ),
                                  // Podcasts
                                  LawyerPodcastsListWidget(
                                    lawyerPodcastsSlug:
                                        '${generalController.selectedLawyerForView.userName}',
                                  ),
                                  // Broadcasts
                                  LawyerBroadcastsListWidget(
                                    lawyerBroadcastsSlug:
                                        '${generalController.selectedLawyerForView.userName}',
                                  ),
                                ]))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        );
      });
    });
  }
}
