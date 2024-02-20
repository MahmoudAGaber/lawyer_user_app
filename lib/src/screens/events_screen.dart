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
import '../widgets/appbar_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/custom_skeleton_loader.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => EventsScreenState();
}

class EventsScreenState extends State<EventsScreen> {
  final logic = Get.put(AllEventsController());
  // final List numbers = List.generate(30, (index) => "Item $index");

  @override
  void initState() {
    super.initState();
    // postMethod(context, '$getAllEvents?page=1', null, false, getAllEventsRepo);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(builder: (generalController) {
      return GetBuilder<AllEventsController>(builder: (allEventsController) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: AppBarWidget(
              leadingIcon: 'assets/icons/Expand_left.png',
              leadingOnTap: () {
                Get.back();
              },
              richTextSpan: const TextSpan(
                text: 'Events',
                style: AppTextStyles.appbarTextStyle2,
                children: <TextSpan>[],
              ),
            ),
          ),
          body: !allEventsController.allEventsLoader
              ? const CustomGridViewSkeletonLoader(
                  highlightColor: AppColors.grey,
                  seconds: 2,
                  totalCount: 5,
                  aspectRatio: 0.9,
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      GridView.count(
                        padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                        crossAxisCount: 2,
                        crossAxisSpacing: 18.0,
                        mainAxisSpacing: 12.0,
                        childAspectRatio: 0.7,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(
                          allEventsController.eventsListForPagination.length,
                          (index) {
                            return InkWell(
                              onTap: () {
                                allEventsController.updateSelectedEventForView(
                                    allEventsController
                                        .eventsListForPagination[index]);

                                Get.toNamed(PageRoutes.blogDetailScreen);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      // ignore: unrelated_type_equality_checks
                                      child: allEventsController
                                                  .eventsListForPagination[
                                                      index]
                                                  .image
                                                  ?.length
                                                  .toString !=
                                              'null'
                                          ? Image(
                                              image: NetworkImage(
                                                  "$mediaUrl${allEventsController.eventsListForPagination[index].image}"),
                                              fit: BoxFit.cover,
                                              height: 160.h,
                                              width: 160.w,
                                            )
                                          : Image(
                                              image: const AssetImage(
                                                  'assets/images/events-image-2.png'),
                                              height: 110.h,
                                            ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    // "Blog post title here",
                                    "${allEventsController.eventsListForPagination[index].name}",
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.bodyTextStyle2,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    // "Lawyer Name",
                                    "${allEventsController.eventsListForPagination[index].lawyerName}",
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.bodyTextStyle11,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    // "25th March, 2023",
                                    "${allEventsController.eventsListForPagination[index].createdAt?.split(",").first}",
                                    textAlign: TextAlign.start,
                                    style: AppTextStyles.bodyTextStyle3,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      allEventsController.eventsListForPagination.length ==
                                  allEventsController
                                      .getAllEventsModel.data!.data!.length &&
                              allEventsController.getAllEventsModel.data!.meta!
                                      .currentPage !=
                                  allEventsController
                                      .getAllEventsModel.data!.meta!.lastPage
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
                                            allEventsController
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
