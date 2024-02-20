import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';
import '../api_services/post_service.dart';
import '../models/customer_appointment_history_model.dart';
import '../repositories/all_lawyers_repo.dart';
import 'general_controller.dart';

class CustomerAppointmentHistoryController extends GetxController {
  GetCustomerAppointmentHistoryModel getCustomerAppointmentHistoryModel =
      GetCustomerAppointmentHistoryModel();

  bool allCustomerAppointmentHistoryLoader = false;
  updateCustomerAppointmentHistoryLoader(bool newValue) {
    allCustomerAppointmentHistoryLoader = newValue;
    update();
  }

  String? selectedLawyerCategory;
  // LawyerModel selectedLawyerForView = LawyerModel();
  GetCustomerAppointmentHistoryDataModel
      getCustomerAppointmentHistoryDataModel =
      GetCustomerAppointmentHistoryDataModel();

  List<CustomerAppointmentHistoryModel>
      customerAllAppointmentHistoryListForPagination = [];

  // updateSelectedLawyerForView(
  //   LawyerModel newValue,
  // ) {
  //   selectedLawyerForView = newValue;

  //   update();
  // }

  ///------------------------------- Lawyers-data-check
  bool getCustomerAppointmentHistoryDataCheck = false;
  getCustomerAppointmentHistorysDataCheck(bool value) {
    getCustomerAppointmentHistoryDataCheck = value;
    update();
  }

  int? selectedLawyerCategoryIndex = 0;
  updateSelectedLawyerCategoryIndex(int? newValue) {
    selectedLawyerCategoryIndex = newValue;
    update();
  }

  /// paginated-data-fetch
  Future paginationDataLoad(BuildContext context) async {
    // perform fetching data delay
    // await new Future.delayed(new Duration(seconds: 2));

    log("load more");
    // update data and loading status
    if (getCustomerAppointmentHistoryModel.data!.meta!.lastPage! >
        getCustomerAppointmentHistoryModel.data!.meta!.currentPage!) {
      Get.find<GeneralController>().changeGetPaginationProgressCheck(true);

      postMethod(
          context,
          '${getCustomerAppointmentHistoryModel.data!.meta!.path}',
          {
            'page':
                (getCustomerAppointmentHistoryModel.data!.meta!.currentPage! +
                    1),
            'perPage': getCustomerAppointmentHistoryModel.data!.meta!.perPage
          },
          false,
          getAllLawyersRepo);
      update();
    }
  }

  updateLawyerListForPagination(
      CustomerAppointmentHistoryModel customerAppointmentHistoryModel) {
    customerAllAppointmentHistoryListForPagination
        .add(customerAppointmentHistoryModel);
    update();
  }

  ///----app-bar-settings-----start
  ScrollController? scrollController;
  bool lastStatus = true;
  double height = 100.h;

  bool get isShrink {
    return scrollController!.hasClients &&
        scrollController!.offset > (height - kToolbarHeight);
  }

  void scrollListener() {
    if (isShrink != lastStatus) {
      lastStatus = isShrink;
      update();
    }
  }
}
