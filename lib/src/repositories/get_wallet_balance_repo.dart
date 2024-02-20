import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/wallet_controller.dart';
import '../models/get_wallet_balance_model.dart';

getWalletBalanceRepo(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<WalletController>().getWalletBalanceModel =
        GetWalletBalanceModel.fromJson(response);

    Get.find<WalletController>().updateWalletBalanceLoader(true);
    log("${Get.find<WalletController>().getWalletBalanceModel.data} Wallet Balance");
  } else if (!responseCheck) {
    Get.find<WalletController>().updateWalletBalanceLoader(false);
  }
}
