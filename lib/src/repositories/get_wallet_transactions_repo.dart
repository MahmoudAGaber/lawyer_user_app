import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/general_controller.dart';
import '../controllers/wallet_controller.dart';
import '../models/get_wallet_transactions_model.dart';

getWalletTransactionsRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    if (Get.find<WalletController>()
        .walletTransactionForPagination
        .isNotEmpty) {
      Get.find<WalletController>().walletTransactionForPagination = [];
    }
    Get.find<WalletController>().getWalletTransactionsModel =
        GetWalletTransactionsModel.fromJson(response);

    Get.find<WalletController>().updateWalletTransactionLoader(true);
    log("${Get.find<WalletController>().getWalletTransactionsModel.data!.data!.length.toString()} Total Lawyer Wallet Transactions Length");

    log("${Get.find<WalletController>().getWalletTransactionsModel.data!.data!} Only Data Lawyer Wallet Transactions History");

    for (var element in Get.find<WalletController>()
        .getWalletTransactionsModel
        .data!
        .data!) {
      Get.find<WalletController>()
          .updateWalletTransactionsForPagination(element);
    }

    Get.find<GeneralController>().changeGetPaginationProgressCheck(false);
  } else if (!responseCheck) {
    Get.find<WalletController>().updateWalletTransactionLoader(true);
  }
}
