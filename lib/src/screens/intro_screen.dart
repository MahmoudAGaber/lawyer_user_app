import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lawyer_consultant/src/config/app_colors.dart';
import 'package:lawyer_consultant/src/controllers/all_law_firms_controller.dart';
import 'package:lawyer_consultant/src/controllers/all_top_rated_lawyers_controller.dart';

import 'package:resize/resize.dart';

import '../api_services/get_service.dart';

import '../api_services/post_service.dart';
import '../api_services/urls.dart';
import '../config/app_font.dart';
import '../config/app_text_styles.dart';
import '../controllers/all_events_controller.dart';
import '../controllers/all_featured_lawyers_controller.dart';
import '../controllers/all_lawyers_controller.dart';
import '../controllers/general_controller.dart';

import '../models/logged_in_user_model.dart';
import '../repositories/all_events_repo.dart';
import '../repositories/all_featured_lawyers_repo.dart';
import '../repositories/all_law_firms_repo.dart';
import '../repositories/all_lawyers_repo.dart';
import '../repositories/all_top_rated_lawyers_repo.dart';
import '../routes.dart';
import '../widgets/button_widget.dart';
import '../widgets/intro_indicator_slider_widget.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final allLawyerslogic = Get.put(AllLawyersController());
  final featuredLawyerslogic = Get.put(AllFeaturedLawyersController());
  final topRatedLawyerslogic = Get.put(AllTopRatedLawyersController());
  final allEventslogic = Get.put(AllEventsController());
  final allLawFirmslogic = Get.put(AllLawFirmsController());

  @override
  void initState() {
    if (Get.find<GeneralController>().storageBox.hasData('userData') &&
        Get.find<GeneralController>().storageBox.hasData('authToken')) {
      Get.find<GeneralController>().currentUserModel = User.fromJson(jsonDecode(
          Get.find<GeneralController>().storageBox.read('userData')));
    }
    log("${Get.find<GeneralController>().storageBox.read('userData')} Intro User Data");
    // Get All Lawyers on Home Page
    postMethod(
        context, '$getAllLawyers?page=1', null, false, getAllLawyersRepo);
    // Get All Featured Lawyers on Home Page
    getMethod(context, getFeaturedLawyers, {'limit': 10}, false,
        getAllFeaturedLawyersRepo);
    // Get All Top Rated Lawyers on Home Page
    getMethod(context, getTopRatedLawyers, {'limit': 10}, false,
        getAllTopRatedLawyersRepo);
    // Get All Events on Home Page
    postMethod(context, '$getAllEvents?page=1', null, false, getAllEventsRepo);
    // Get All Law Firms on Home Page
    postMethod(
        context, '$getAllLawFirms?page=1', null, false, getAllLawFirmsRepo);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/app-icon.png",
                  height: 50.h,
                  width: 50.w,
                ),
                const SizedBox(width: 5.0),
                RichText(
                  // Controls how the text should be aligned horizontally
                  textAlign: TextAlign.center,
                  // Whether the text should break at soft line breaks
                  softWrap: true,
                  text: const TextSpan(
                    text: 'Law ',
                    style: TextStyle(
                        color: AppColors.white,
                        fontFamily: AppFont.primaryFontFamily,
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Advisor',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontFamily: AppFont.primaryFontFamily,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AspectRatio(
              aspectRatio: 0.68,
              child: IndicatorSliderWidget(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(70, 22, 70, 22),
              child: ButtonWidgetOne(
                buttonText: 'Next',
                onTap: () {
                  Get.toNamed(PageRoutes.homeScreen);
                },
                buttonTextStyle: AppTextStyles.buttonTextStyle1,
                borderRadius: 12,
                buttonColor: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
