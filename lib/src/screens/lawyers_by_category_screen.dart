import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';
import '../api_services/post_service.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../controllers/general_controller.dart';
import '../controllers/lawyers_by_category_controller.dart';
import '../controllers/search_controller.dart';
import '../localization/language_constraints.dart';
import '../repositories/lawyers_by_category_repo.dart';
import '../routes.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/custom_skeleton_loader.dart';
import '../widgets/search_filter_widget.dart';

class LawyersByCategoryScreen extends StatefulWidget {
  const LawyersByCategoryScreen({
    super.key,
  });

  @override
  State<LawyersByCategoryScreen> createState() =>
      _LawyersByCategoryScreenState();
}

class _LawyersByCategoryScreenState extends State<LawyersByCategoryScreen> {
  final logic = Get.put(LawyersByCategoryController());
  String? categorySlug = Get.parameters["categorySlug"];
  String? categoryName = Get.parameters["categoryName"];
  @override
  void initState() {
    super.initState();
    postMethod(context, '$getLawyersByCategory + $categorySlug', null, false,
        getLawyersByCategoryRepo);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(builder: (generalController) {
      return GetBuilder<LawyersByCategoryController>(
          builder: (lawyersByCategoryController) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: AppBarWidget(
              richTextSpan: TextSpan(
                text: categoryName,
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
            child: !lawyersByCategoryController.lawyersByCategoryLoader
                ? CustomVerticalSkeletonLoader(
                    height: 200.h,
                    highlightColor: AppColors.grey,
                    seconds: 2,
                    totalCount: 5,
                    width: 140.w,
                  )
                : Column(
                    children: [
                      const SizedBox(height: 18),
                      SearchFilterWidget(
                        onSearchTap: () {},
                        controller: Get.find<SearchBarController>()
                            .searchTextController,
                      ),
                      ...List.generate(
                          lawyersByCategoryController
                              .getAllLawyersModel.data!.data!.length, (index) {
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
                                child: lawyersByCategoryController
                                            .getAllLawyersModel
                                            .data!
                                            .data![index]
                                            .image !=
                                        null
                                    ? Image(
                                        image: NetworkImage(
                                            "$mediaUrl${lawyersByCategoryController.getAllLawyersModel.data!.data![index].image}"),
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
                                        "${lawyersByCategoryController.getAllLawyersModel.data!.data![index].name}",
                                        textAlign: TextAlign.start,
                                        style: AppTextStyles.bodyTextStyle2,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                        child: ListView(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          children: List.generate(
                                            lawyersByCategoryController
                                                .getAllLawyersModel
                                                .data!
                                                .data![index]
                                                .lawyerCategories!
                                                .length,
                                            (index1) {
                                              return Text(
                                                "${lawyersByCategoryController.getAllLawyersModel.data!.data![index].lawyerCategories![index1].name} | ",
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
                                      const Text(
                                        'LLB | Master of Dispute Resolution | Master of Legal Studies | Master of Laws',
                                        textAlign: TextAlign.start,
                                        style: AppTextStyles.bodyTextStyle4,
                                      ),
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
                                                      lawyersByCategoryController
                                                          .lawyerListForPagination[
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
                                                  lawyersByCategoryController
                                                      .lawyerListForPagination[
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
                                                    .updateSelectedLawyerForView(
                                                        lawyersByCategoryController
                                                                .lawyerListForPagination[
                                                            index]);

                                                Get.toNamed(PageRoutes
                                                    .lawyerProfileScreen);
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

                      // lawyersByCategoryController
                      //         .lawyerListForPagination.isNotEmpty
                      lawyersByCategoryController
                                  .lawyerListForPagination.length ==
                              lawyersByCategoryController
                                  .getAllLawyersModel.data!.data!.length
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
                                            lawyersByCategoryController
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
