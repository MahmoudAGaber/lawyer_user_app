import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';

import '../api_services/post_service.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../controllers/general_controller.dart';
import '../controllers/lawyer_broadcasts_controller.dart';
import '../localization/language_constraints.dart';
import '../repositories/lawyer_broadcasts_repo.dart';
import 'button_widget.dart';
import 'custom_skeleton_loader.dart';

class LawyerBroadcastsListWidget extends StatefulWidget {
  final String lawyerBroadcastsSlug;
  LawyerBroadcastsListWidget({
    super.key,
    required this.lawyerBroadcastsSlug,
  });

  @override
  State<LawyerBroadcastsListWidget> createState() =>
      _LawyerBroadcastsListWidgetState();
}

class _LawyerBroadcastsListWidgetState
    extends State<LawyerBroadcastsListWidget> {
  final logic = Get.put(LawyerBroadcastsController());

  @override
  void initState() {
    super.initState();
    postMethod(context, '$getLawyerBroadcasts/${widget.lawyerBroadcastsSlug}',
        null, false, getLawyerBroadcastsRepo);
    print(
        "${logic.getLawyerBroadcastsModel.data?.data!.length} lawyer Broadcasts length");
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(builder: (generalController) {
      return GetBuilder<LawyerBroadcastsController>(
          builder: (lawyerBroadcastsController) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SingleChildScrollView(
            child: !lawyerBroadcastsController.allLawyerBroadcastsLoader
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
                          lawyerBroadcastsController.getLawyerBroadcastsModel
                              .data!.data!.length, (index) {
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
                                  "${lawyerBroadcastsController.getLawyerBroadcastsModel.data!.data![index].name}",
                                  textAlign: TextAlign.start,
                                  style: AppTextStyles.bodyTextStyle2,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${lawyerBroadcastsController.getLawyerBroadcastsModel.data!.data![index].description}',
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
                      lawyerBroadcastsController
                                  .lawyerBroadcastsListForPagination.length !=
                              lawyerBroadcastsController
                                  .getLawyerBroadcastsModel.data!.data!.length
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
                                    : lawyerBroadcastsController
                                            .lawyerBroadcastsListForPagination
                                            .isNotEmpty
                                        ? ButtonWidgetOne(
                                            buttonText: getTranslated('loadMore',context),
                                            onTap: () {
                                              lawyerBroadcastsController
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
                                                "No Broadcasts Found",
                                                style: AppTextStyles
                                                    .bodyTextStyle2,
                                              ),
                                            ),
                                          ),
                              ),
                            )
                          : lawyerBroadcastsController.getLawyerBroadcastsModel
                                  .data!.data!.isNotEmpty
                              ? const SizedBox()
                              : const Center(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                                    child: Text(
                                      "No Broadcasts Found",
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
