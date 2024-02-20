import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawyer_consultant/src/widgets/button_widget.dart';
import 'package:lawyer_consultant/src/widgets/custom_skeleton_loader.dart';
import 'package:resize/resize.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../controllers/all_lawyers_controller.dart';
import '../controllers/general_controller.dart';
import '../localization/language_constraints.dart';
import '../routes.dart';

class HomeAllLawyersListWidget extends StatefulWidget {
  const HomeAllLawyersListWidget({
    Key? key,
  }) : super(key: key);

  @override
  _HomeAllLawyersListWidgetState createState() =>
      _HomeAllLawyersListWidgetState();
}

class _HomeAllLawyersListWidgetState extends State<HomeAllLawyersListWidget> {
  final logic = Get.put(AllLawyersController());

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
      return GetBuilder<AllLawyersController>(builder: (allLawyersController) {
        return !allLawyersController.allLawyersLoader
            ? CustomHorizontalSkeletonLoader(
                containerHeight: 140.h,
                listHeight: 140.h,
                highlightColor: AppColors.grey,
                seconds: 2,
                totalCount: 5,
                containerWidth: 200.w,
              )
            : allLawyersController.getAllLawyersModel.data!.data!.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 3 / 1.26,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: allLawyersController
                              .getAllLawyersModel.data!.data!.length,
                          padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.primaryColor),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(18),
                                    // ignore: unrelated_type_equality_checks
                                    child: allLawyersController
                                                .getAllLawyersModel
                                                .data!
                                                .data![index]
                                                .image
                                                ?.length !=
                                            null
                                        ? Image(
                                            image: NetworkImage(
                                                "$mediaUrl${allLawyersController.getAllLawyersModel.data!.data![index].image}"),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          // "Jhon Doe",
                                          allLawyersController
                                              .getAllLawyersModel
                                              .data!
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
                                                allLawyersController
                                                    .getAllLawyersModel
                                                    .data!
                                                    .data![index]
                                                    .lawyerCategories!
                                                    .length, (index1) {
                                              return Text(
                                                "${allLawyersController.getAllLawyersModel.data!.data![index].lawyerCategories![index1].name} | ",
                                                textAlign: TextAlign.start,
                                                style: AppTextStyles
                                                    .bodyTextStyle3,
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
                                            allLawyersController
                                                        .getAllLawyersModel
                                                        .data!
                                                        .data![index]
                                                        .description !=
                                                    null
                                                ? allLawyersController
                                                    .getAllLawyersModel
                                                    .data!
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
                                                      allLawyersController
                                                          .getAllLawyersModel
                                                          .data!
                                                          .data![index]);
                                              Get.toNamed(PageRoutes
                                                  .lawyerProfileScreen);
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
                            return SizedBox(width: 18);
                          },
                        ),
                      ),
                    ],
                  )
                :  SizedBox(
                    child: Center(
                      child: Text(
                        getTranslated("noDataFound",context),
                        style: AppTextStyles.bodyTextStyle2,
                      ),
                    ),
                  );
      });
    });
  }
}
