import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawyer_consultant/src/config/app_text_styles.dart';
import 'package:resize/resize.dart';

import '../api_services/get_service.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';

import '../controllers/general_controller.dart';
import '../controllers/lawyer_main_categories_controller.dart';

import '../repositories/lawyer_main_categories_repo.dart';
import 'custom_skeleton_loader.dart';

class HomeCategoriesListWidget extends StatefulWidget {
  final VoidCallback categoryOnTap;
  const HomeCategoriesListWidget({
    Key? key,
    required this.categoryOnTap,
  }) : super(key: key);

  @override
  State<HomeCategoriesListWidget> createState() =>
      _HomeCategoriesListWidgetState();
}

class _HomeCategoriesListWidgetState extends State<HomeCategoriesListWidget> {
  final logic = Get.put(LawyerMainCategoriesController());
  @override
  void initState() {
    super.initState();
    getMethod(context, getLawyerMainCategoriesURL, null, false,
        getLawyerMainCategoriesRepo);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(builder: (generalController) {
      return GetBuilder<LawyerMainCategoriesController>(
          builder: (lawyerMainCategoriesController) {
        return !lawyerMainCategoriesController.lawyerMainCategoriesLoader
            ? CustomHorizontalSkeletonLoader(
                containerHeight: 110.h,
                listHeight: 110.h,
                highlightColor: AppColors.grey,
                seconds: 2,
                totalCount: 5,
                containerWidth: 100.w,
              )
            : Column(
                children: [
                  AspectRatio(
                    aspectRatio: 4 / 1.3,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 5,
                      padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                      itemBuilder: (context, position) {
                        return InkWell(
                          onTap: widget.categoryOnTap,
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                padding:
                                    const EdgeInsets.fromLTRB(19, 19, 19, 19),
                                // height: MediaQuery.of(context).size.height * 0.125,
                                width:
                                    MediaQuery.of(context).size.width * 0.243,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.primaryColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                // child: Image.asset(
                                //     "assets/icons/🦆 icon _University_.png"),
                                child: Image.network(
                                  mediaUrl +
                                      lawyerMainCategoriesController
                                          .getLawyerMainCategoriesModel
                                          .data![position]
                                          .icon,
                                  height: 30.w,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Center(
                                  child: Text(
                                      lawyerMainCategoriesController
                                          .getLawyerMainCategoriesModel
                                          .data![position]
                                          .name
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      maxLines: 2,
                                      style: AppTextStyles.bodyTextStyle1),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, position) {
                        return const SizedBox(width: 12);
                      },
                    ),
                  ),
                ],
              );
      });
    });
  }
}
