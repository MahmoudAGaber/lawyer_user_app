import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';

import '../api_services/post_service.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../controllers/general_controller.dart';
import '../controllers/lawyer_podcasts_controller.dart';
import '../localization/language_constraints.dart';
import '../repositories/lawyer_podcasts_repo.dart';
import 'button_widget.dart';
import 'custom_skeleton_loader.dart';

class LawyerPodcastsListWidget extends StatefulWidget {
  final String lawyerPodcastsSlug;
  LawyerPodcastsListWidget({
    super.key,
    required this.lawyerPodcastsSlug,
  });

  @override
  State<LawyerPodcastsListWidget> createState() =>
      _LawyerPodcastsListWidgetState();
}

class _LawyerPodcastsListWidgetState extends State<LawyerPodcastsListWidget> {
  final logic = Get.put(LawyerPodcastsController());

  @override
  void initState() {
    super.initState();
    postMethod(context, '$getLawyerPodcasts/${widget.lawyerPodcastsSlug}', null,
        false, getLawyerPodcastsRepo);
    print(
        "${logic.getLawyerPodcastsModel.data?.data!.length} lawyer podcasts length");
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(builder: (generalController) {
      return GetBuilder<LawyerPodcastsController>(
          builder: (lawyerPodcastsController) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SingleChildScrollView(
            child: !lawyerPodcastsController.allLawyerPodcastsLoader
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
                    child: CustomVerticalSkeletonLoader(
                      height: 200.h,
                      highlightColor: AppColors.grey,
                      seconds: 2,
                      totalCount: 5,
                      width: 140.w,
                    ),
                  )
                : Column(
                    children: [
                      const SizedBox(height: 18),
                      ...List.generate(
                          lawyerPodcastsController.getLawyerPodcastsModel.data!
                              .data!.length, (index) {
                        return Container(
                          padding: const EdgeInsets.fromLTRB(8, 14, 8, 14),
                          margin: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                          decoration: BoxDecoration(
                            color: AppColors.offWhite,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 6, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${lawyerPodcastsController.getLawyerPodcastsModel.data!.data![index].name}",
                                  textAlign: TextAlign.start,
                                  style: AppTextStyles.bodyTextStyle2,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${lawyerPodcastsController.getLawyerPodcastsModel.data!.data![index].description}',
                                  textAlign: TextAlign.start,
                                  style: AppTextStyles.bodyTextStyle7,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),

                      // allLawyersController
                      //         .lawyerListForPagination.isNotEmpty
                      lawyerPodcastsController
                                  .lawyerPodcastsListForPagination.length !=
                              lawyerPodcastsController
                                  .getLawyerPodcastsModel.data!.data!.length
                          ? Center(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 18),
                                width: MediaQuery.of(context).size.width * .35,
                                child: generalController
                                        .getPaginationProgressCheck
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
                                    : lawyerPodcastsController
                                            .lawyerPodcastsListForPagination
                                            .isNotEmpty
                                        ? ButtonWidgetOne(
                                            buttonText: getTranslated('loadMore',context),
                                            onTap: () {
                                              lawyerPodcastsController
                                                  .paginationDataLoad(context);
                                            },
                                            buttonTextStyle:
                                                AppTextStyles.buttonTextStyle7,
                                            borderRadius: 5,
                                            buttonColor: AppColors.primaryColor,
                                          )
                                        : const Center(
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 50, 0, 0),
                                              child: Text(
                                                "No Podcasts Found",
                                                style: AppTextStyles
                                                    .bodyTextStyle2,
                                              ),
                                            ),
                                          ),
                              ),
                            )
                          : lawyerPodcastsController
                                  .getLawyerPodcastsModel.data!.data!.isNotEmpty
                              ? const SizedBox()
                              : const Center(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                                    child: Text(
                                      "No Podcasts Found",
                                      style: AppTextStyles.bodyTextStyle2,
                                    ),
                                  ),
                                ),
                    ],
                  ),
          ),
        );
      });
    });
  }
}
