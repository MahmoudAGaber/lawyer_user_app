import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawyer_consultant/src/controllers/all_law_firms_controller.dart';
import 'package:resize/resize.dart';

import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../controllers/general_controller.dart';

import '../localization/language_constraints.dart';
import '../routes.dart';
import 'custom_skeleton_loader.dart';

class HomeLawFirmsListWidget extends StatefulWidget {
  const HomeLawFirmsListWidget({
    Key? key,
  }) : super(key: key);

  @override
  _HomeLawFirmsListWidgetState createState() => _HomeLawFirmsListWidgetState();
}

class _HomeLawFirmsListWidgetState extends State<HomeLawFirmsListWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(builder: (generalController) {
      return GetBuilder<AllLawFirmsController>(
          builder: (allLawFirmsController) {
        return !allLawFirmsController.allLawFirmsLoader
            ? CustomHorizontalSkeletonLoader(
                containerHeight: 140.h,
                listHeight: 140.h,
                highlightColor: AppColors.grey,
                seconds: 2,
                totalCount: 5,
                containerWidth: 110.w,
              )
            : allLawFirmsController.getAllLawFirmsModel.data!.data!.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 3 / 1.2,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: allLawFirmsController
                              .getAllLawFirmsModel.data!.data!.length,
                          padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                generalController.updateSelectedLawFirmForView(
                                    allLawFirmsController.getAllLawFirmsModel
                                        .data!.data![index]);
                                Get.toNamed(PageRoutes.lawFirmProfileScreen);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(18),
                                    child: allLawFirmsController
                                                .getAllLawFirmsModel
                                                .data!
                                                .data![index]
                                                .image
                                                .toString !=
                                            'null'
                                        ? Image(
                                            image: NetworkImage(
                                                "$mediaUrl${allLawFirmsController.getAllLawFirmsModel.data!.data![index].image}"),
                                            height: 150.h,
                                          )
                                        : Image(
                                            image: const AssetImage(
                                                'assets/images/events-image-2.png'),
                                            height: 150.h,
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
