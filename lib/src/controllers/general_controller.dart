import 'dart:math' as math;
import 'package:intl/intl.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lawyer_consultant/src/models/all_law_firms_model.dart';
import 'package:lawyer_consultant/src/models/customer_appointment_history_model.dart';
import 'package:resize/resize.dart';

import '../config/app_colors.dart';
import '../models/channel_event_model.dart';
import '../models/generate_agoratoken_model.dart';
import '../models/logged_in_user_model.dart';
import '../models/all_events_model.dart';
import '../models/all_lawyers_model.dart';
import '../routes.dart';
import '../screens/agora_call/get_agora_token_model.dart';
import '../screens/agora_call/get_fcm_token_model.dart';
import '../widgets/custom_dialog.dart';

class GeneralController extends GetxController {
  GetStorage storageBox = GetStorage();

  ///---get-user-profile
  // GetConsultantProfileModel getConsultantProfileModel =
  //     GetConsultantProfileModel();
  int bottomNavIndex = 1;
  bool formLoaderController = false;

  updateBottomNavIndex(int newValue) {
    bottomNavIndex = newValue;
    update();
  }

  updateFormLoaderController(bool newValue) {
    formLoaderController = newValue;
    update();
  }

  bool callLoaderController = false;

  updateCallLoaderController(bool newValue) {
    callLoaderController = newValue;
    update();
  }

  ///---appbar-open
  String? appBarSelectedCountryCode = '+92';

  updateAppBarSelectedCountryCode(String? newValue) {
    appBarSelectedCountryCode = newValue;
    update();
  }

  ///---appbar-close

  ///--focus-out
  focusOut(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  User? currentUserModel; //  for saving all-generic-app-data

  ///---random-string-open
  String chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  math.Random rnd = math.Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));

  String? selectedChannel;

  updateSelectedChannel(String? newValue) {
    selectedChannel = newValue;
    update();
  }

  GenerateAgoraTokenModel generateAgoraTokenModel = GenerateAgoraTokenModel();

  ChannelEventModel channelEventModel = ChannelEventModel();

  int callerType = 2;

  updateCallerType(dynamic i) {
    callerType = i;
    update();
  }

  GetAgoraTokenModel getAgoraTokenModel = GetAgoraTokenModel();
  bool? goForCall = true;

  updateGoForCall(bool? newValue) {
    goForCall = newValue;
    update();
  }

  String? channelForCall;
  String? tokenForCall;

  updateTokenForCall(String? newValueToken) {
    tokenForCall = newValueToken;
    update();
  }

  updateChannelForCall(String? newValueChannel) {
    channelForCall = newValueChannel;
    update();
  }

  GetFcmTokenModel getFcmTokenModel = GetFcmTokenModel();
  int? userIdForSendNotification;

  updateUserIdForSendNotification(int? newValue) {
    userIdForSendNotification = newValue;
    update();
  }

  int? appointmentIdForSendNotification;

  updateAppointmentIdForSendNotification(int? newValue) {
    appointmentIdForSendNotification = newValue;
    update();
  }

  dynamic displayDateTime(dateandTime) {
    return DateFormat('dd.MM.yyyy HH:mm')
        .format(DateTime.parse(dateandTime).toLocal());
  }

  dynamic displayDate(date) {
    return DateFormat('dd.MM.yyyy').format(DateTime.parse(date).toLocal());
  }

  String? notificationTitle;
  String? notificationBody;
  String? notificationRouteApp;
  String? notificationRouteWeb;
  String? sound;

  updateNotificationBody(String? newTitle, String? newBody, String? newRouteApp,
      String? newRouteWeb, String? newSound) {
    notificationTitle = newTitle;
    notificationBody = newBody;
    notificationRouteApp = newRouteApp;
    notificationRouteWeb = newRouteWeb;
    sound = newSound;
    update();
  }

  ///---fcm-token
  String? fcmToken;

  updateFcmToken(BuildContext context) async {
    await FirebaseMessaging.instance.requestPermission();
    await FirebaseMessaging.instance.getToken().then((value) {
      fcmToken = value;
      storageBox.write('fcmToken', fcmToken);
      // getId(context);
    }).catchError((onError) {});
  }

  // Future<String?> getId(BuildContext context) async {
  //   var deviceInfo = DeviceInfoPlugin();
  //   if (Platform.isIOS) {
  //     var iosDeviceInfo = await deviceInfo.iosInfo;
  //     postMethod(
  //         context,
  //         fcmUpdateUrl,
  //         {
  //           'token': '123',
  //           'fcm_token': fcmToken,
  //           'device_id': iosDeviceInfo.identifierForVendor,
  //           'user_id': Get.find<GeneralController>().storageBox.read('userID')
  //         },
  //         false,
  //         updateFcmTokenRepo);
  //     return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  //   } else {
  //     var androidDeviceInfo = await deviceInfo.androidInfo;

  //     postMethod(
  //         context,
  //         fcmUpdateUrl,
  //         {
  //           'token': '123',
  //           'fcm_token': fcmToken,
  //           'device_id': androidDeviceInfo.androidId,
  //           'user_id': Get.find<GeneralController>().storageBox.read('userID')
  //         },
  //         false,
  //         updateFcmTokenRepo);
  //     return androidDeviceInfo.androidId; // unique ID on Android
  //   }
  // }

  List<Language> localeList = [
    Language(1, 'English', '🇺🇸', 'en', 'US'),
    Language(2, 'اردو', '🇵🇰', 'ur', 'PK'),
    Language(3, 'हिन्दी', '🇮🇳', 'hi', 'IN'),
    Language(4, 'বাংলা', '🇧🇩', 'bn', 'BD'),
  ];

  Language? selectedLocale;

  updateSelectedLocale(Language? newValue) {
    selectedLocale = newValue;
    update();
  }

  checkLanguage() {
    if (storageBox.hasData('languageIndex')) {
      updateSelectedLocale(
          localeList[int.parse(storageBox.read('languageIndex').toString())]);
    } else {
      storageBox.write('languageCode', localeList[0].languageCode);
      storageBox.write('countryCode', localeList[0].countryCode);
      updateSelectedLocale(localeList[0]);
    }
  }

  ///------------------------------- pagination-check
  bool getPaginationProgressCheck = false;

  changeGetPaginationProgressCheck(bool value) {
    getPaginationProgressCheck = value;
    update();
  }

//-----------------------------selected lawyer for detail view
  LawyerModel selectedLawyerForView = LawyerModel();
  updateSelectedLawyerForView(
    LawyerModel newValue,
  ) {
    selectedLawyerForView = newValue;
    update();
  }

//-----------------------------selected Appointment History for detail view
  CustomerAppointmentHistoryModel selectedAppointmentHistoryForView =
      CustomerAppointmentHistoryModel();
  updateSelectedAppointmentHistoryForView(
    CustomerAppointmentHistoryModel newValue,
  ) {
    selectedAppointmentHistoryForView = newValue;
    update();
  }

  //-----------------------------selected event for detail view
  EventModel selectedEventForView = EventModel();
  updateSelectedEventForView(
    EventModel newValue,
  ) {
    selectedEventForView = newValue;
    update();
  }

  //-----------------------------selected law firm for detail view
  LawFirmModel selectedLawFirmForView = LawFirmModel();
  updateSelectedLawFirmForView(
    LawFirmModel newValue,
  ) {
    selectedLawFirmForView = newValue;
    update();
  }

  ///-------------------------------server-check
  bool serverErrorCheck = true;

  changeServerErrorCheck(bool value) {
    serverErrorCheck = value;
    update();
  }

  ///------------------------------- loader-check
  bool loaderCheck = false;

  changeLoaderCheck(bool value) {
    loaderCheck = value;
    update();
  }

  //---------------- logged-in-user
  // ignore: prefer_typing_uninitialized_variables
  // var signInUserToken;

  showMessageDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialogBox(
          title: "Please Sign In First",
          titleColor: AppColors.customDialogInfoColor,
          descriptions: '',
          text: "Sign In",
          functionCall: () {
            Get.back();
            Get.toNamed(PageRoutes.signinScreen);
          },
          img: 'assets/icons/error.png',
        );
      },
    );
  }

  customDropDownDialogForLocale(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            spreadRadius: 3,
                            blurRadius: 9,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "LanguageConstant.selectLanguage.tr",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24.sp,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * .3,
                        child: ListView(
                          children: List.generate(localeList.length, (index) {
                            return InkWell(
                              onTap: () {
                                storageBox.write('languageCode',
                                    localeList[index].languageCode);
                                storageBox.write('countryCode',
                                    localeList[index].countryCode);
                                storageBox.write('languageIndex', index);
                                selectedLocale = localeList[index];
                                var locale = Locale(
                                    localeList[index].languageCode,
                                    localeList[index].countryCode);
                                Get.updateLocale(locale);
                                update();
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      localeList[index].name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18.sp,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      localeList[index].flag,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20.sp,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        });
  }

  String? inAppWebService;
  String? notificationMenteeId, notificationFee;
}

class Language {
  final int id;
  final String name;
  final String flag;
  final String languageCode;
  final String countryCode;

  Language(this.id, this.name, this.flag, this.languageCode, this.countryCode);
}
