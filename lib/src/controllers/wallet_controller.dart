import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/get_wallet_balance_model.dart';
import '../models/get_wallet_transactions_model.dart';
import 'general_controller.dart';

class WalletController extends GetxController {
  GetWalletTransactionsModel getWalletTransactionsModel =
      GetWalletTransactionsModel(); //  for saving Lawyer Wallet Transactions
  WalletTransactionModel walletTransactionModel =
      WalletTransactionModel(); //  for saving Lawyer Wallet Transactions
  GetWalletBalanceModel getWalletBalanceModel =
      GetWalletBalanceModel(); //  for saving Lawyer Wallet Balance

  // Basic Information Controllers
  TextEditingController userProfileFirstNameController =
      TextEditingController();
  TextEditingController userProfileLastNameController = TextEditingController();

  List<WalletTransactionModel> walletTransactionForPagination = [];

  bool allWalletTransactionLoader = false;
  updateWalletTransactionLoader(bool newValue) {
    allWalletTransactionLoader = newValue;
    update();
  }

  bool allWalletBalanceLoader = false;
  updateWalletBalanceLoader(bool newValue) {
    allWalletBalanceLoader = newValue;
    update();
  }

  ///------------------------------- Wallet-Transaction-data-check
  bool getWalletTransactionCheck = false;
  getWalletTransactionDataCheck(bool value) {
    getWalletTransactionCheck = value;
    update();
  }

  int? selectedWalletWithdrawalIndex = 0;
  updateSelectedWalletWithdrawalIndex(int? newValue) {
    selectedWalletWithdrawalIndex = newValue;
    update();
  }

  int? selectedWalletTransactionIndex = 0;
  updateSelectedWalletTransactionIndex(int? newValue) {
    selectedWalletTransactionIndex = newValue;
    update();
  }

  /// Wallet-Transaction-paginated-data-fetch
  Future walletTransactionPaginationDataLoad(BuildContext context) async {
    // perform fetching data delay
    // await new Future.delayed(new Duration(seconds: 2));

    log("load more");
    // update data and loading status
    if (getWalletTransactionsModel.data!.meta!.lastPage! >
        getWalletTransactionsModel.data!.meta!.currentPage!) {
      Get.find<GeneralController>().changeGetPaginationProgressCheck(true);

      update();
    }
  }

  updateWalletTransactionsForPagination(
      WalletTransactionModel walletTransactionModel) {
    walletTransactionForPagination.add(walletTransactionModel);
    update();
  }

  ///------------------------------- user-profile-data-check
  bool getUserProfileDataCheck = false;

  changeGetUserProfileDataCheck(bool value) {
    getUserProfileDataCheck = value;
    update();
  }
}
