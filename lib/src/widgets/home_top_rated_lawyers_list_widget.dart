import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawyer_consultant/src/widgets/button_widget.dart';
import 'package:lawyer_consultant/src/widgets/custom_skeleton_loader.dart';
import 'package:resize/resize.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../controllers/all_lawyers_controller.dart';
import '../controllers/all_top_rated_lawyers_controller.dart';
import '../controllers/general_controller.dart';

import '../localization/language_constraints.dart';
import '../routes.dart';

class HomeTopRatedLawyersListWidget extends StatefulWidget {
  const HomeTopRatedLawyersListWidget({
    Key? key,
  }) : super(key: key);

  @override
  _HomeTopRatedLawyersListWidgetState createState() =>
      _HomeTopRatedLawyersListWidgetState();
}

class _HomeTopRatedLawyersListWidgetState
    extends State<HomeTopRatedLawyersListWidget> {
  final logic = Get.put(AllTopRatedLawyersController());
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
      return GetBuilder<AllTopRatedLawyersController>(
          builder: (allTopRatedLawyersController) {
        return !allTopRatedLawyersController.topRatedLawyersLoader
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
                      itemCount: allTopRatedLawyersController
                          .getAllTopRatedLawyersModel.data!.length,
                      //  >=
                      //         3
                      //     ? 3
                      //     : allTopRatedLawyersController
                      //         .getAllTopRatedLawyersModel.data!.length,
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
                                child: allTopRatedLawyersController
                                            .getAllTopRatedLawyersModel
                                            .data![index]
                                            .image
                                            ?.length !=
                                        null
                                    ? Image(
                                        image: NetworkImage(
                                            "$mediaUrl${allTopRatedLawyersController.getAllTopRatedLawyersModel.data![index].image}"),
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
                                      allTopRatedLawyersController
                                          .getAllTopRatedLawyersModel
                                          .data![index]
                                          .name
                                          .toString(),
                                      textAlign: TextAlign.start,
                                      style: AppTextStyles.bodyTextStyle2,
                                    ),
                                    SizedBox(
                                      height: 10.h,
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
                                            allTopRatedLawyersController
                                                .getAllTopRatedLawyersModel
                                                .data![index]
                                                .lawyerCategories!
                                                .length, (index1) {
                                          return Text(
                                            "${allTopRatedLawyersController.getAllTopRatedLawyersModel.data![index].lawyerCategories![index1].name} | ",
                                            textAlign: TextAlign.start,
                                            style: AppTextStyles.bodyTextStyle3,
                                          );
                                        }),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    SizedBox(
                                      width: 120.w,
                                      child: Text(
                                        allTopRatedLawyersController
                                                    .getAllTopRatedLawyersModel
                                                    .data![index]
                                                    .description !=
                                                null
                                            ? allTopRatedLawyersController
                                                .getAllTopRatedLawyersModel
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
                                      padding:  EdgeInsets.fromLTRB(
                                          0, 12, 0, 8),
                                      child: ButtonWidgetOne(
                                        buttonText: getTranslated('bookNow',context),
                                        onTap: () {
                                          generalController
                                              .updateSelectedLawyerForView(
                                                  allTopRatedLawyersController
                                                      .getAllTopRatedLawyersModel
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
                        return SizedBox(width: 18.w);
                      },
                    ),
                  ),
                ],
              );
      });
    });
  }
}
