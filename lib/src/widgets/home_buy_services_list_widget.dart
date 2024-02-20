import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../controllers/all_events_controller.dart';
import '../controllers/general_controller.dart';
import '../localization/language_constraints.dart';
import '../routes.dart';
import 'custom_skeleton_loader.dart';

class HomeBuyServicesListWidget extends StatefulWidget {
  const HomeBuyServicesListWidget({
    Key? key,
  }) : super(key: key);

  @override
  _HomeBuyServicesListWidgetState createState() =>
      _HomeBuyServicesListWidgetState();
}

class _HomeBuyServicesListWidgetState extends State<HomeBuyServicesListWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(builder: (generalController) {
      return GetBuilder<AllEventsController>(builder: (allEventsController) {
        return !allEventsController.allEventsLoader
            ? CustomHorizontalSkeletonLoader(
                containerHeight: 140.h,
                listHeight: 140.h,
                highlightColor: AppColors.grey,
                seconds: 2,
                totalCount: 5,
                containerWidth: 110.w,
              )
            : allEventsController.getAllEventsModel.data!.data!.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 3 / 1.74,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: allEventsController
                              .getAllEventsModel.data!.data!.length,
                          padding: EdgeInsets.fromLTRB(18.w, 0, 18.w, 0),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                generalController.updateSelectedEventForView(
                                    allEventsController
                                        .getAllEventsModel.data!.data![index]);
                                Get.toNamed(PageRoutes.eventDetailScreen);
                              },
                              child: Container(
                                padding:
                                    EdgeInsets.fromLTRB(8.w, 8.w, 8.w, 8.w),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.primaryColor),
                                    borderRadius: BorderRadius.circular(18)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(18),
                                      child: allEventsController
                                                  .getAllEventsModel
                                                  .data!
                                                  .data![index]
                                                  .image
                                                  .toString !=
                                              'null'
                                          ? Image(
                                              image: NetworkImage(
                                                  "$mediaUrl${allEventsController.getAllEventsModel.data!.data![index].image}"),
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
                                      // allEventsController
                                      //     .getAllEventsModel.data!.data![index].name
                                      //     .toString(),
                                      "Legal Consultation",
                                      style: AppTextStyles.bodyTextStyle2,
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          "Start from \$10",
                                          style: AppTextStyles.bodyTextStyle3,
                                        ),
                                        SizedBox(width: 8.w),
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColors.primaryColor,
                                                  width: 2)),
                                          child: ImageIcon(
                                            AssetImage(
                                                "assets/icons/Expand_right.png"),
                                            size: 16.h,
                                            color: AppColors.secondaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
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
