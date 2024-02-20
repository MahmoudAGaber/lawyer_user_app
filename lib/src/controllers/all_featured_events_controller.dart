import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';

import '../models/all_featured_events_model.dart';

class AllFeaturedEventsController extends GetxController {
  GetAllFeaturedEventsModel getAllFeaturedEventsModel =
      GetAllFeaturedEventsModel();

  bool eventLoader = false;
  updateEventLoader(bool newValue) {
    eventLoader = newValue;
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
