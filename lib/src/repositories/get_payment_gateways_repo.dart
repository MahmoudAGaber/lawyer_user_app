import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/general_controller.dart';
import '../controllers/payment_gateways_controller.dart';
import '../models/get_payment_gateways_model.dart';

getPaymentGatewaysRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<PaymentGatewaysController>().getPaymentGatewaysModel =
        GetPaymentGatewaysModel.fromJson(response);
    Get.find<PaymentGatewaysController>().updatePaymentGatewaysLoader(true);
    log("${Get.find<PaymentGatewaysController>().getPaymentGatewaysModel.data!} Total Payment Gateways Length");

    Get.find<GeneralController>().changeGetPaginationProgressCheck(false);
  } else if (!responseCheck) {
    Get.find<PaymentGatewaysController>().updatePaymentGatewaysLoader(true);
  }
}
