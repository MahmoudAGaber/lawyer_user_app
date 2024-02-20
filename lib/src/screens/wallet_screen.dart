import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawyer_consultant/src/controllers/all_settings_controller.dart';
import 'package:resize/resize.dart';
import '../api_services/get_service.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../controllers/general_controller.dart';
import '../controllers/lawyer_book_appointment_controller.dart';
import '../controllers/payment_gateways_controller.dart';
import '../controllers/wallet_controller.dart';
import '../localization/language_constraints.dart';
import '../repositories/get_payment_gateways_repo.dart';
import '../repositories/get_wallet_balance_repo.dart';
import '../repositories/get_wallet_transactions_repo.dart';
import '../routes.dart';

import '../widgets/appbar_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/custom_skeleton_loader.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => WalletScreenState();
}

class WalletScreenState extends State<WalletScreen> {
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');
  final paymentGatewaysLogic = Get.put(PaymentGatewaysController());
  final walletLogic = Get.put(WalletController());
  final lawyerAppointmentSchdulelogic =
      Get.put(LawyerAppointmentScheduleController());
  bool isVisibleTransactionsHistory = true;
  String? fromWebView = Get.parameters["fromWebView"];

  @override
  void initState() {
    super.initState();
    // Get All Wallet Balance
    getMethod(context, getWalletBalanceURL, null, true, getWalletBalanceRepo);
    // Get All Wallet Transactions
    getMethod(context, getWalletTransactionURL, null, true,
        getWalletTransactionsRepo);
    // Get All Payment Gateways
    getMethod(
        context, getPaymentGatewaysURL, null, false, getPaymentGatewaysRepo);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(builder: (generalController) {
      return GetBuilder<WalletController>(builder: (walletController) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: AppBarWidget(
              leadingIcon: 'assets/icons/Expand_left.png',
              leadingOnTap: () {
                fromWebView == "Yes"
                    ? Get.toNamed(PageRoutes.homeScreen)
                    : Get.back();
              },
              richTextSpan:  TextSpan(
                text: getTranslated('wallet',context),
                style: AppTextStyles.appbarTextStyle2,
                children: <TextSpan>[],
              ),
            ),
          ),
          body: !walletController.allWalletTransactionLoader
              ? CustomVerticalSkeletonLoader(
                  height: 200.h,
                  highlightColor: AppColors.grey,
                  seconds: 2,
                  totalCount: 5,
                  width: 140.w,
                )
              : Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: AppColors.gradientOne,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 18),
                            const Text(
                              "Available Amount",
                              style: AppTextStyles.bodyTextStyle5,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              Get.find<GetAllSettingsController>()
                                  .getDisplayAmount(int.parse(walletController
                                      .getWalletBalanceModel.data)),
                              style: AppTextStyles.bodyTextStyle5,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(36, 12, 36, 18),
                              child: ButtonWidgetOne(
                                borderRadius: 10,
                                buttonColor: AppColors.offWhite,
                                buttonText: 'Add to Wallet',
                                buttonTextStyle: AppTextStyles.buttonTextStyle7,
                                onTap: () {
                                  Get.toNamed(PageRoutes.walletTopUpScreen);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 18.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Transactions History",
                            style: AppTextStyles.headingTextStyle4,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              visualDensity: const VisualDensity(
                                  horizontal: 0, vertical: 0),
                              backgroundColor: AppColors.primaryColor,
                              // minimumSize: const Size.fromHeight(50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (isVisibleTransactionsHistory == true) {
                                  isVisibleTransactionsHistory = false;
                                } else if (isVisibleTransactionsHistory ==
                                    false) {
                                  isVisibleTransactionsHistory = true;
                                }
                              });
                            },
                            child: const Text(
                              "Transactions",
                              style: AppTextStyles.buttonTextStyle2,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 18.h),
                      walletController.walletTransactionForPagination.isNotEmpty
                          ? Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: walletController
                                    .walletTransactionForPagination.length,
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Dismissible(
                                    key: UniqueKey(),

                                    onDismissed: (DismissDirection direction) {
                                      if (direction ==
                                          DismissDirection.endToStart) {
                                        // Get.toNamed(PageRoutes.paymentDetailScreen);
                                      } else if (direction ==
                                          DismissDirection.startToEnd) {
                                        // DismissDirection.none;
                                      }
                                    },
                                    // Show a red background as the item is swiped away.
                                    background: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          12, 10, 12, 10),
                                      margin: const EdgeInsets.only(bottom: 18),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),
                                        gradient: AppColors.gradientOne,
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional.centerEnd,
                                        child: Image.asset(
                                            "assets/icons/View.png"),
                                      ),
                                    ),

                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          14, 17, 14, 17),
                                      margin: const EdgeInsets.only(bottom: 18),
                                      decoration: BoxDecoration(
                                        color: AppColors.offWhite,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${walletController.walletTransactionForPagination[index].id}",
                                            style: AppTextStyles.bodyTextStyle1,
                                          ),
                                          SizedBox(width: 12.w),
                                          Expanded(
                                            child: Text(
                                              "${walletController.walletTransactionForPagination[index].type}",
                                              style:
                                                  AppTextStyles.bodyTextStyle1,
                                            ),
                                          ),
                                          SizedBox(width: 12.w),
                                          Text(
                                            Get.find<GetAllSettingsController>()
                                                .getDisplayAmount(int.parse(
                                                    walletController
                                                        .walletTransactionForPagination[
                                                            index]
                                                        .amount!)),
                                            style: AppTextStyles.bodyTextStyle1,
                                          ),
                                          SizedBox(width: 12.w),
                                          Text(
                                            generalController.displayDate(
                                                walletController
                                                    .walletTransactionForPagination[
                                                        index]
                                                    .createdAt),
                                            style: AppTextStyles.bodyTextStyle1,
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : SizedBox(
                              height: 100.h,
                              child:  Center(
                                child: Text(
                                  getTranslated("noDataFound",context),
                                  style: AppTextStyles.bodyTextStyle2,
                                ),
                              ),
                            ),
                      walletController.walletTransactionForPagination.length ==
                              walletController
                                  .getWalletTransactionsModel.data!.data!.length
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
                                            walletController
                                                .walletTransactionPaginationDataLoad(
                                                    context);
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
