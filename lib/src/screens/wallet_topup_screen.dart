import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';

import '../api_services/post_service.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../controllers/make_payment_controller.dart';
import '../controllers/payment_gateways_controller.dart';
import '../repositories/make_wallet_topup_repo.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_form_field_widget.dart';

class WalletTopUpScreen extends StatefulWidget {
  const WalletTopUpScreen({super.key});

  @override
  State<WalletTopUpScreen> createState() => _WalletTopUpScreenState();
}

class _WalletTopUpScreenState extends State<WalletTopUpScreen> {
  final makePaymentLogic = Get.put(MakePaymentController());
  dynamic selectedPaymentGateway;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              text: 'Wallet Topup',
              style: AppTextStyles.appbarTextStyle2,
              children: <TextSpan>[],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Choose your Payment Method",
                style: AppTextStyles.headingTextStyle4,
              ),
              SizedBox(height: 20.h),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.white, //background color of dropdown button
                  border: Border.all(
                      color: AppColors.primaryColor,
                      width: 1), //border of dropdown button
                  borderRadius: BorderRadius.circular(
                      10), //border raiuds of dropdown button
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 5.h, 16.w, 5.h),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 1,
                      physics: const AlwaysScrollableScrollPhysics(),
                      // padding: const EdgeInsets.only(top: 18),
                      itemBuilder: (context, index) {
                        return DropdownButtonHideUnderline(
                          child: DropdownButtonFormField(
                            hint: const Text(
                              'Please Choose Payment Method',
                              style: AppTextStyles.bodyTextStyle11,
                            ), // Not necessary for Option 1
                            value: selectedPaymentGateway,

                            items: Get.find<PaymentGatewaysController>()
                                .getPaymentGatewaysModel
                                .data!
                                .map((gatewaysName) {
                              return DropdownMenuItem(
                                value: gatewaysName.code,
                                child: DropdownMenuItem(
                                  child: Row(
                                    children: [
                                      Image.network(
                                        "$mediaUrl${gatewaysName.image!}",
                                        height: 35.h,
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Text(gatewaysName.name!,
                                          style: AppTextStyles.bodyTextStyle11),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                selectedPaymentGateway = newValue;

                                print(
                                    "GATEWAYS SELECTED NAME ${selectedPaymentGateway}");
                              });
                            },
                            decoration:
                                const InputDecoration.collapsed(hintText: ''),
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.secondaryColor,
                            ),
                            iconEnabledColor: Colors.white, //Icon color
                            style: AppTextStyles.subHeadingTextStyle1,
                            dropdownColor:
                                AppColors.white, //dropdown background color
                            isExpanded: true, //make true to make width 100%
                          ),
                        );
                      }),
                ),
              ),
              SizedBox(height: 20.h),
              TextFormFieldWidget(
                hintText: 'Amount',
                controller: Get.find<MakePaymentController>().amountController,
                onChanged: (String? value) {
                  Get.find<MakePaymentController>().amountController.text ==
                      value;
                  Get.find<MakePaymentController>().update();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Amount Field Required';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20.h),
              ButtonWidgetOne(
                  onTap: () {
                    // Book Appointment API Make Payment
                    postMethod(
                        context,
                        walletTopupURL,
                        {
                          "gateway": selectedPaymentGateway,
                          "amount": int.parse(Get.find<MakePaymentController>()
                              .amountController
                              .text)
                        },
                        true,
                        makeWalletTopupRepo);
                  },
                  buttonText: "Make Topup",
                  buttonTextStyle: AppTextStyles.bodyTextStyle8,
                  borderRadius: 10,
                  buttonColor: AppColors.primaryColor),
            ],
          ),
        ));
  }
}
