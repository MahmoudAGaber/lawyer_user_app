import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';
import 'package:url_launcher/url_launcher.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../controllers/general_controller.dart';
import '../controllers/law_firm_reviews_controller.dart';
import '../localization/language_constraints.dart';
import '../routes.dart';
import '../widgets/appbar_widget.dart';

import '../widgets/law_firm_reviews_list_widget.dart';

class LawFirmProfileScreen extends StatefulWidget {
  LawFirmProfileScreen();

  @override
  State<LawFirmProfileScreen> createState() => _LawFirmProfileScreenState();
}

class _LawFirmProfileScreenState extends State<LawFirmProfileScreen> {
  final logic = Get.put(LawFirmReviewsController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(builder: (generalController) {
      return Scaffold(
        backgroundColor: AppColors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: AppBarWidget(
            richTextSpan: const TextSpan(
              text: 'Law Firm Profile',
              style: AppTextStyles.appbarTextStyle2,
              children: <TextSpan>[],
            ),
            leadingIcon: "assets/icons/Expand_left.png",
            leadingOnTap: () {
              Get.back();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                decoration: BoxDecoration(
                    gradient: AppColors.gradientOne,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child:
                              generalController.selectedLawFirmForView.image !=
                                      null
                                  ? Image(
                                      image: NetworkImage(
                                        "$mediaUrl${generalController.selectedLawFirmForView.image}",
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // "Jhon Doe",
                                generalController.selectedLawFirmForView.name
                                    .toString(),
                                textAlign: TextAlign.start,
                                style: AppTextStyles.bodyTextStyle5,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              SizedBox(
                                height: 10.h,
                                child: ListView(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: List.generate(
                                      generalController.selectedLawFirmForView
                                          .lawFirmCategories!.length, (index1) {
                                    return Text(
                                      "${generalController.selectedLawFirmForView.lawFirmCategories![index1].name} | ",
                                      // "Category",
                                      textAlign: TextAlign.start,
                                      style: AppTextStyles.bodyTextStyle6,
                                    );
                                  }),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              // const Text(
                              //   'LLB | Master of Dispute Resolution | Master of Legal Studies | Master of Laws',
                              //   textAlign: TextAlign.start,
                              //   style: AppTextStyles.bodyTextStyle6,
                              // ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  RatingBar.builder(
                                    // initialRating: generalController
                                    //     .selectedLawFirmsForView.rating!
                                    //     .toDouble(),
                                    initialRating: 3,
                                    minRating: 1,
                                    itemSize: 15.h,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    ignoreGestures: true,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 0.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (double value) {},
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    // '4.5',
                                    "(${generalController.selectedLawFirmForView.rating!})",
                                    textAlign: TextAlign.start,
                                    style: AppTextStyles.bodyTextStyle6,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                // 'User Name',
                                "${generalController.selectedLawFirmForView.userName}",
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
                                      await launchUrl(
                                          Uri.parse("https://flutter.dev"));
                                    },
                                    child: Image.asset(
                                        "assets/icons/🦆 icon _Facebook F_.png"),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(
                                      "assets/icons/🦆 icon _Instagram_.png"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(
                                      "assets/icons/🦆 icon _Twitter_.png"),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(18, 16, 18, 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Associated Laywers",
                      style: AppTextStyles.headingTextStyle2,
                    ),
                  ],
                ),
              ),
              generalController
                      .selectedLawFirmForView.lawFirmLawyers!.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 3 / 1.69,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: generalController
                                .selectedLawFirmForView.lawFirmLawyers!.length,
                            padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  generalController.updateSelectedLawyerForView(
                                      generalController.selectedLawFirmForView
                                          .lawFirmLawyers![index]);
                                  Get.toNamed(PageRoutes.lawyerProfileScreen);
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(18),
                                      child: generalController
                                                  .selectedLawFirmForView
                                                  .lawFirmLawyers![index]
                                                  .image !=
                                              null
                                          ? Image(
                                              image: NetworkImage(
                                                  "$mediaUrl${generalController.selectedLawFirmForView.lawFirmLawyers![index].image}"),
                                              height: 150.h,
                                            )
                                          : Image(
                                              image: const AssetImage(
                                                  'assets/images/events-image-2.png'),
                                              height: 150.h,
                                            ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      generalController.selectedLawFirmForView
                                          .lawFirmLawyers![index].name!,
                                      style: AppTextStyles.bodyTextStyle2,
                                    ),
                                    const SizedBox(height: 6),
                                    SizedBox(
                                      height: 10.h,
                                      child: ListView(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        children: List.generate(
                                            generalController
                                                .selectedLawFirmForView
                                                .lawFirmLawyers![index]
                                                .lawyerCategories!
                                                .length, (index1) {
                                          return Text(
                                            generalController
                                                    .selectedLawFirmForView
                                                    .lawFirmLawyers![index]
                                                    .lawyerCategories!
                                                    .isNotEmpty
                                                ? "${generalController.selectedLawFirmForView.lawFirmLawyers![index].lawyerCategories![index1].name} | "
                                                : "",
                                            // "Category",
                                            textAlign: TextAlign.start,
                                            style: AppTextStyles.bodyTextStyle3,
                                          );
                                        }),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, position) {
                              return SizedBox(width: 18.w);
                            },
                          ),
                        ),
                      ],
                    )
                  : Text(
                      getTranslated("noDataFound",context),
                      style: AppTextStyles.bodyTextStyle10,
                    ),
              DefaultTabController(
                  length: 2, // length of tabs
                  initialIndex: 0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Theme(
                          data: ThemeData()
                              .copyWith(dividerColor: AppColors.primaryColor),
                          child: TabBar(
                            labelColor: AppColors.white,
                            unselectedLabelColor: AppColors.secondaryColor,
                            dividerColor: AppColors.transparent,
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
                            ],
                          ),
                        ),
                        Container(
                            height: 400,
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                    color: AppColors.primaryColor, width: 1),
                              ),
                            ),
                            child: TabBarView(children: <Widget>[
                              // About
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(18, 12, 18, 18),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'About ${generalController.selectedLawFirmForView.name}',
                                        style: AppTextStyles.bodyTextStyle2),
                                    const SizedBox(height: 14),
                                    Text(
                                        '${generalController.selectedLawFirmForView.description}',
                                        style: AppTextStyles.bodyTextStyle7),
                                  ],
                                ),
                              ),
                              // Reviews
                              LawFirmReviewsListWidget(
                                lawFirmReviewsSlug:
                                    '${generalController.selectedLawFirmForView.userName}',
                              ),
                            ]))
                      ])),
            ],
          ),
        ),
      );
    });
  }
}
