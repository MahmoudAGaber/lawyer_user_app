import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:lawyer_consultant/src/controllers/all_law_firms_controller.dart';
import 'package:resize/resize.dart';
import '../api_services/post_service.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../controllers/all_lawyers_controller.dart';
import '../controllers/general_controller.dart';
import '../controllers/search_controller.dart';
import '../localization/language_constraints.dart';
import '../repositories/all_law_firms_repo.dart';
import '../routes.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/custom_skeleton_loader.dart';
import '../widgets/search_filter_widget.dart';

class LawFirmsScreen extends StatefulWidget {
  const LawFirmsScreen({super.key});

  @override
  State<LawFirmsScreen> createState() => _LawFirmsScreenState();
}

class _LawFirmsScreenState extends State<LawFirmsScreen> {
  final logic = Get.put(AllLawFirmsController());

  @override
  void initState() {
    super.initState();
    Get.find<SearchBarController>().searchTextController.clear();
    // postMethod(
    //     context, '$getAllLawyers?page=1', null, false, getAllLawyersRepo);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(builder: (generalController) {
      return GetBuilder<AllLawFirmsController>(
          builder: (allLawFirmsController) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: AppBarWidget(
              richTextSpan:  TextSpan(
                text: getTranslated('lawFirms',context),
                style: AppTextStyles.appbarTextStyle2,
                children: <TextSpan>[],
              ),
              leadingIcon: "assets/icons/Expand_left.png",
              leadingOnTap: () {
                Get.back();
              },
            ),
          ),
          body: !allLawFirmsController.allLawFirmsLoader
              ? CustomVerticalSkeletonLoader(
                  height: 200.h,
                  highlightColor: AppColors.grey,
                  seconds: 2,
                  totalCount: 5,
                  width: 140.w,
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 18),
                      SearchFilterWidget(
                        onSearchTap: () {
                          postMethod(
                              context,
                              getAllLawFirms,
                              {
                                'search': Get.find<SearchBarController>()
                                    .searchTextController
                                    .text
                              },
                              false,
                              getAllSearchedLawFirmsRepo);
                        },
                        controller: Get.find<SearchBarController>()
                            .searchTextController,
                      ),
                      ...List.generate(
                          allLawFirmsController
                              .lawFirmsListForPagination.length, (index) {
                        return Container(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                          margin: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                          decoration: BoxDecoration(
                            color: AppColors.offWhite,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Row(
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: allLawFirmsController
                                            .lawFirmsListForPagination[index]
                                            .image
                                            ?.length !=
                                        null
                                    ? Image(
                                        image: NetworkImage(
                                            "$mediaUrl${allLawFirmsController.lawFirmsListForPagination[index].image}"),
                                        height: 110.h,
                                      )
                                    : Image(
                                        image: const AssetImage(
                                            'assets/images/lawyer-image.png'),
                                        height: 110.h,
                                      ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 0, 6, 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "${allLawFirmsController.lawFirmsListForPagination[index].name}",
                                        textAlign: TextAlign.start,
                                        style: AppTextStyles.bodyTextStyle2,
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      SizedBox(
                                        height: 14.h,
                                        child: ListView(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          children: List.generate(
                                            allLawFirmsController
                                                .lawFirmsListForPagination[
                                                    index]
                                                .lawFirmCategories!
                                                .length,
                                            (index1) {
                                              return Text(
                                                "${allLawFirmsController.lawFirmsListForPagination[index].lawFirmCategories![index1].name} | ",
                                                textAlign: TextAlign.start,
                                                style: AppTextStyles
                                                    .bodyTextStyle3,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      // const Text(
                                      //   'LLB | Master of Dispute Resolution | Master of Legal Studies | Master of Laws',
                                      //   textAlign: TextAlign.start,
                                      //   style: AppTextStyles.bodyTextStyle4,
                                      // ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 14, 0, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                RatingBar.builder(
                                                  initialRating:
                                                      allLawFirmsController
                                                          .lawFirmsListForPagination[
                                                              index]
                                                          .rating!
                                                          .toDouble(),
                                                  minRating: 1,
                                                  itemSize: 15.h,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  ignoreGestures: true,
                                                  itemPadding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 0.0),
                                                  itemBuilder: (context, _) =>
                                                      const Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  onRatingUpdate:
                                                      (double value) {},
                                                ),
                                                SizedBox(width: 5.w),
                                                Text(
                                                  // '4.5',
                                                  allLawFirmsController
                                                      .lawFirmsListForPagination[
                                                          index]
                                                      .rating
                                                      .toString(),
                                                  textAlign: TextAlign.start,
                                                  style: AppTextStyles
                                                      .bodyTextStyle4,
                                                ),
                                              ],
                                            ),
                                            ButtonWidgetOne(
                                              buttonText: getTranslated('profile',context),
                                              onTap: () {
                                                generalController
                                                    .updateSelectedLawFirmForView(
                                                        allLawFirmsController
                                                                .lawFirmsListForPagination[
                                                            index]);

                                                Get.toNamed(
                                                  PageRoutes
                                                      .lawFirmProfileScreen,
                                                );
                                              },
                                              buttonTextStyle: AppTextStyles
                                                  .buttonTextStyle2,
                                              borderRadius: 5,
                                              buttonColor:
                                                  AppColors.secondaryColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),

                      // allLawFirmsController
                      //         .lawFirmsListForPagination.isNotEmpty
                      allLawFirmsController.lawFirmsListForPagination.length ==
                              allLawFirmsController
                                  .getAllLawFirmsModel.data!.data!.length
                          ? Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 18),
                              width: MediaQuery.of(context).size.width * .35,
                              child:
                                  generalController.getPaginationProgressCheck
                                      ? Container(
                                          height: generalController
                                                  .getPaginationProgressCheck
                                              ? 50.0
                                              : 0,
                                          color: Colors.transparent,
                                          child: const Center(
                                            child: CircularProgressIndicator(
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                        )
                                      : ButtonWidgetOne(
                                          buttonText: getTranslated('loadMore',context),
                                          onTap: () {
                                            allLawFirmsController
                                                .paginationDataLoad(context);
                                          },
                                          buttonTextStyle:
                                              AppTextStyles.buttonTextStyle7,
                                          borderRadius: 5,
                                          buttonColor: AppColors.primaryColor,
                                        ))
                          : const SizedBox(),
                    ],
                  ),
                ),
        );
      });
    });
  }
}
