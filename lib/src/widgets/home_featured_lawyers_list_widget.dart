import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawyer_consultant/src/widgets/button_widget.dart';
import 'package:lawyer_consultant/src/widgets/custom_skeleton_loader.dart';
import 'package:resize/resize.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../controllers/all_featured_lawyers_controller.dart';
import '../controllers/all_lawyers_controller.dart';
import '../controllers/general_controller.dart';

import '../localization/language_constraints.dart';
import '../routes.dart';

class HomeFeaturedLawyersListWidget extends StatefulWidget {
  const HomeFeaturedLawyersListWidget({
    Key? key,
  }) : super(key: key);

  @override
  _HomeFeaturedLawyersListWidgetState createState() =>
      _HomeFeaturedLawyersListWidgetState();
}

class _HomeFeaturedLawyersListWidgetState
    extends State<HomeFeaturedLawyersListWidget> {
  final logic = Get.put(AllFeaturedLawyersController());
  final allLawyerslogic = Get.put(AllLawyersController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(builder: (generalController) {
      return GetBuilder<AllFeaturedLawyersController>(
          builder: (allFeaturedLawyersController) {
        return !allFeaturedLawyersController.featuredLawyersLoader
            ? CustomHorizontalSkeletonLoader(
                containerHeight: 140.h,
                listHeight: 140.h,
                highlightColor: AppColors.grey,
                seconds: 2,
                totalCount: 5,
                containerWidth: 200.w,
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 3 / 1.26,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: allFeaturedLawyersController
                          .getAllFeaturedLawyersModel.data!.length,
                      //  >=
                      //         3
                      //     ? 3
                      //     : allFeaturedLawyersController
                      //         .getAllFeaturedLawyersModel.data!.length,
                      padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primaryColor),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                // ignore: unrelated_type_equality_checks
                                child: allFeaturedLawyersController
                                            .getAllFeaturedLawyersModel
                                            .data![index]
                                            .image
                                            ?.length !=
                                        null
                                    ? Image(
                                        image: NetworkImage(
                                            "$mediaUrl${allFeaturedLawyersController.getAllFeaturedLawyersModel.data![index].image}"),
                                      )
                                    : const Image(
                                        image: AssetImage(
                                            'assets/images/lawyer-image.png'),
                                      ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(14, 0, 14, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      // "Jhon Doe",
                                      allFeaturedLawyersController
                                          .getAllFeaturedLawyersModel
                                          .data![index]
                                          .name
                                          .toString(),
                                      textAlign: TextAlign.start,
                                      style: AppTextStyles.bodyTextStyle2,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                      width: 120.w,
                                      child: ListView(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        children: List.generate(
                                            allFeaturedLawyersController
                                                .getAllFeaturedLawyersModel
                                                .data![index]
                                                .lawyerCategories!
                                                .length, (index1) {
                                          return Text(
                                            "${allFeaturedLawyersController.getAllFeaturedLawyersModel.data![index].lawyerCategories![index1].name} | ",
                                            textAlign: TextAlign.start,
                                            style: AppTextStyles.bodyTextStyle3,
                                          );
                                        }),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: 120.w,
                                      child: Text(
                                        allFeaturedLawyersController
                                                    .getAllFeaturedLawyersModel
                                                    .data![index]
                                                    .description !=
                                                null
                                            ? allFeaturedLawyersController
                                                .getAllFeaturedLawyersModel
                                                .data![index]
                                                .description
                                                .toString()
                                            : "",
                                        textAlign: TextAlign.start,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: AppTextStyles.bodyTextStyle4,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 12, 0, 8),
                                      child: ButtonWidgetOne(
                                        buttonText: getTranslated('bookNow',context),
                                        onTap: () {
                                          generalController
                                              .updateSelectedLawyerForView(
                                                  allFeaturedLawyersController
                                                      .getAllFeaturedLawyersModel
                                                      .data![index]);

                                          Get.toNamed(
                                              PageRoutes.lawyerProfileScreen);
                                        },
                                        buttonTextStyle:
                                            AppTextStyles.buttonTextStyle6,
                                        borderRadius: 5,
                                        buttonColor: AppColors.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, position) {
                        return const SizedBox(width: 18);
                      },
                    ),
                  ),
                ],
              );
      });
    });
  }
}
