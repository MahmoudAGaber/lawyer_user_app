import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

import '../api_services/get_service.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../controllers/general_controller.dart';
import '../controllers/lawyer_main_categories_controller.dart';
import '../controllers/search_controller.dart';
import '../repositories/lawyer_main_categories_repo.dart';
import '../routes.dart';
import '../widgets/category_expansion_tile_widget.dart';
import '../widgets/search_filter_widget.dart';

class CategoryScreen extends StatefulWidget {
  final VoidCallback searchOnTap;
  CategoryScreen({super.key, required this.searchOnTap});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final logic = Get.put(LawyerMainCategoriesController());

  @override
  void initState() {
    super.initState();
    Get.find<SearchBarController>().searchTextController.clear();
    getMethod(context, getLawyerMainCategoriesURL, null, false,
        getLawyerMainCategoriesRepo);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(
      builder: (generalController) {
        return GetBuilder<LawyerMainCategoriesController>(
          builder: (lawyerMainCategoriesController) {
            return Scaffold(
              backgroundColor: AppColors.white,
              body: Padding(
                padding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
                child: Column(
                  children: [
                    SearchFilterWidget(
                      onSearchTap: widget.searchOnTap,
                      controller:
                          Get.find<SearchBarController>().searchTextController,
                    ),
                    !lawyerMainCategoriesController.lawyerMainCategoriesLoader
                        ? SkeletonLoader(
                            period: const Duration(seconds: 2),
                            highlightColor: Colors.grey,
                            direction: SkeletonDirection.ltr,
                            builder: SizedBox(
                              height: 207.h,
                              width: MediaQuery.of(context).size.width,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(3, (index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 15, 0),
                                    child: Container(
                                      width: 183.w,
                                      height: 207.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: Colors.grey,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ))
                        : Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: lawyerMainCategoriesController
                                  .getLawyerMainCategoriesModel.data!.length,
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return CategoryExpansionTileWidget(
                                  categoryTitle: lawyerMainCategoriesController
                                      .getLawyerMainCategoriesModel
                                      .data![index]
                                      .name
                                      .toString(),
                                  categoryIcon:
                                      // "assets/icons/🦆 icon _Tractor_.png",
                                      lawyerMainCategoriesController
                                          .getLawyerMainCategoriesModel
                                          .data![index]
                                          .icon,
                                  subCategoryTile: ListView(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children: List.generate(
                                      lawyerMainCategoriesController
                                          .getLawyerMainCategoriesModel
                                          .data![index]
                                          .categories!
                                          .length,
                                      (index1) {
                                        return Container(
                                          color: AppColors.offWhite,
                                          child: ListTile(
                                            onTap: () {
                                              Get.toNamed(
                                                  PageRoutes
                                                      .lawyersByCategoryScreen,
                                                  parameters: {
                                                    "categorySlug":
                                                        "${lawyerMainCategoriesController.getLawyerMainCategoriesModel.data![index].categories![index1].slug}",
                                                    "categoryName":
                                                        "${lawyerMainCategoriesController.getLawyerMainCategoriesModel.data![index].categories![index1].name}"
                                                  });
                                              // Get.to(
                                              //   () => LawyersByCategoryScreen(
                                              //       categorySlug:
                                              //           "${lawyerMainCategoriesController.getLawyerMainCategoriesModel.data![index].categories![index1].slug}",
                                              //       categoryName:
                                              //           "${lawyerMainCategoriesController.getLawyerMainCategoriesModel.data![index].categories![index1].name}"),
                                              // );
                                            },
                                            leading: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  8, 0, 28, 0),
                                              height: 8,
                                              width: 8,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      AppColors.primaryColor),
                                            ),
                                            title: Text(
                                              "${lawyerMainCategoriesController.getLawyerMainCategoriesModel.data![index].categories![index1].name}",
                                              style:
                                                  AppTextStyles.bodyTextStyle1,
                                            ),
                                            dense: true,
                                            horizontalTitleGap: 0,
                                            contentPadding:
                                                const EdgeInsetsDirectional
                                                    .fromSTEB(20, 8, 20, 8),
                                            minLeadingWidth: 0,
                                            minVerticalPadding: 0,
                                            visualDensity: const VisualDensity(
                                                horizontal: -4, vertical: -4),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
