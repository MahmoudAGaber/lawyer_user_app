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

class HomeUpcomingEventsListWidget extends StatefulWidget {
  const HomeUpcomingEventsListWidget({
    Key? key,
  }) : super(key: key);

  @override
  _HomeUpcomingEventsListWidgetState createState() =>
      _HomeUpcomingEventsListWidgetState();
}

class _HomeUpcomingEventsListWidgetState
    extends State<HomeUpcomingEventsListWidget> {
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
                        aspectRatio: 3 / 1.8,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: allEventsController
                              .getAllEventsModel.data!.data!.length,
                          padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                generalController.updateSelectedEventForView(
                                    allEventsController
                                        .getAllEventsModel.data!.data![index]);
                                Get.toNamed(PageRoutes.eventDetailScreen);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(18),
                                    child: allEventsController.getAllEventsModel
                                                .data!.data![index].image !=
                                            null
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
                                  SizedBox(height: 12.h),
                                  SizedBox(
                                    width: 140.w,
                                    child: Text(
                                      allEventsController.getAllEventsModel
                                          .data!.data![index].name
                                          .toString(),
                                      style: AppTextStyles.bodyTextStyle2,
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    generalController.displayDateTime(
                                        allEventsController.getAllEventsModel
                                            .data!.data![index].startsAt
                                            .toString()),
                                    style: AppTextStyles.bodyTextStyle3,
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
