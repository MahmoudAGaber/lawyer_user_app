import 'dart:convert';
import 'dart:developer';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawyer_consultant/main.dart';
import 'package:lawyer_consultant/src/config/app_colors.dart';
import 'package:lawyer_consultant/src/config/app_text_styles.dart';
import 'package:lawyer_consultant/src/controllers/sign_out_user_controller.dart';
import 'package:lawyer_consultant/src/controllers/signin_controller.dart';
import 'package:lawyer_consultant/src/repositories/sign_out_user_repo.dart';
import 'package:lawyer_consultant/src/screens/splash_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:resize/resize.dart';

import '../api_services/get_service.dart';
import '../api_services/post_service.dart';
import '../api_services/urls.dart';
import '../controllers/all_settings_controller.dart';
import '../controllers/general_controller.dart';
import '../controllers/search_controller.dart';
import '../controllers/logged_in_user_controller.dart';
import '../localization/LocalizationProvider.dart';
import '../localization/language_constraints.dart';
import '../models/logged_in_user_model.dart';
import '../repositories/all_lawyers_repo.dart';
import '../routes.dart';
import '../screens/category_screen.dart';
import '../screens/home_screen.dart';
import '../screens/intro_screen.dart';
import '../screens/lawyers_screen.dart';
import 'appbar_widget.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final loggedInUserLogic = Get.put(LoggedInUserController());
  final signInLogic = Get.put(SigninController());
  final signOutUserLogic = Get.put(SignOutUserController());
  // int Get.find<GeneralController>().bottomNavIndex = 1;
  String _selectedLanguage = 'ar';


  @override
  void initState() {
    if (Get.find<GeneralController>().storageBox.hasData('userData')) {
      Get.find<GeneralController>().currentUserModel = User.fromJson(jsonDecode(
          Get.find<GeneralController>().storageBox.read('userData')));
    }
    log("${Get.find<GeneralController>().storageBox.read('userData')} Bottom User Data");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetScreens = <Widget>[
      LawyersScreen(),
      HomeScreen(
        allCategoryOnTap: () =>
            setState(() => Get.find<GeneralController>().bottomNavIndex = 2),
        searchOnTap: () {
          setState(() {
            Get.find<GeneralController>().updateBottomNavIndex(0);
          });

          postMethod(
              context,
              getAllLawyers,
              {
                'search':
                    Get.find<SearchBarController>().searchTextController.text
              },
              false,
              getAllSearchedLawyersRepo);
        },
      ),
      CategoryScreen(
        searchOnTap: () {
          setState(() {
            Get.find<GeneralController>().updateBottomNavIndex(0);
          });

          postMethod(
              context,
              getAllLawyers,
              {
                'search':
                    Get.find<SearchBarController>().searchTextController.text
              },
              false,
              getAllSearchedLawyersRepo);
        },
      ),
    ];
    return GetBuilder<LoggedInUserController>(builder: (loggedInUserLogic) {
      return ModalProgressHUD(
        progressIndicator: const CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
        inAsyncCall: Get.find<GeneralController>().formLoaderController,
        child: Scaffold(
          backgroundColor: AppColors.white,
          key: scaffoldKey,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: AppBarWidget(
              richTextSpan: TextSpan(
                text: Get.find<GeneralController>().bottomNavIndex == 1
                    ? getTranslated('lawAdvisor',context)
                    : Get.find<GeneralController>().bottomNavIndex == 0
                        ? getTranslated('professionalLawyers', context)
                        : Get.find<GeneralController>().bottomNavIndex == 2
                            ? getTranslated('categories', context)
                            : '',
                style: AppTextStyles.appbarTextStyle2,
                // children: <TextSpan>[
                //   Get.find<GeneralController>().bottomNavIndex == 1
                //       ? const TextSpan(
                //           text: 'Advisor',
                //           style: AppTextStyles.appbarTextStyle1,
                //         )
                //       : const TextSpan(),
                // ],
              ),
              leadingIcon: "assets/icons/Sort.png",
              leadingOnTap: () {
                scaffoldKey.currentState?.openDrawer();
              },
            ),
          ),
          body: Center(
            child: widgetScreens
                .elementAt(Get.find<GeneralController>().bottomNavIndex),
          ),
          drawer: Drawer(
            backgroundColor: AppColors.offWhite,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
              ),
            ),
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                      gradient: AppColors.gradientOne), //BoxDecoration
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 10.w, 0),
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Get.find<GeneralController>()
                                    .storageBox
                                    .read('authToken') !=
                                null
                            ? Get.find<GeneralController>()
                                        .currentUserModel!
                                        .loginInfo!
                                        .image !=
                                    null
                                ? CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        '$mediaUrl${Get.find<GeneralController>().currentUserModel!.loginInfo!.image}'),
                                    radius: 35.h,
                                  )
                                : Image.asset(
                                    "assets/icons/user-avatar.png",
                                    height: 60.h,
                                  )
                            : Image.asset(
                                "assets/icons/user-avatar.png",
                                height: 60.h,
                                fit: BoxFit.contain,
                              ),
                      ),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Get.find<GeneralController>()
                                        .storageBox
                                        .read('authToken') !=
                                    null
                                ? Text(
                                    "${Get.find<GeneralController>().currentUserModel!.loginInfo!.name} ",
                                    style: AppTextStyles.bodyTextStyle5,
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      Get.toNamed(PageRoutes.signinScreen);
                                    },
                                    child:  Text(
                                      getTranslated("signIn",context),
                                      style: AppTextStyles.bodyTextStyle5,
                                    ),
                                  ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              Get.find<GeneralController>()
                                          .storageBox
                                          .read('authToken') !=
                                      null
                                  // ? "${loggedInUserLogic.loggedInUserModel.data!.email}"
                                  ? "${Get.find<GeneralController>().currentUserModel!.email} "
                                  : "",
                              style: AppTextStyles.subHeadingTextStyle3,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ), //DrawerHeader
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Get.find<GeneralController>()
                                  .storageBox
                                  .read('authToken') !=
                              null
                          ? ListTile(
                              isThreeLine: false,
                              dense: true,
                              visualDensity: const VisualDensity(
                                  vertical: -3, horizontal: -3),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 0),
                              leading: const ImageIcon(
                                AssetImage("assets/icons/User.png"),
                                color: AppColors.secondaryColor,
                              ),
                              title:Text(
                                getTranslated('profile',context),
                                style: AppTextStyles.subHeadingTextStyle1,
                              ),
                              onTap: () {
                                Get.toNamed(PageRoutes.userProfileScreen);
                              },
                            )
                          : const SizedBox(),
                      // ListTile(
                      //   isThreeLine: false,
                      //   dense: true,
                      //   visualDensity:
                      //       const VisualDensity(vertical: -1, horizontal: -3),
                      //   contentPadding: const EdgeInsets.symmetric(
                      //       horizontal: 12, vertical: 0),
                      //   leading: const ImageIcon(
                      //     AssetImage("assets/icons/Bell_pin.png"),
                      //     color: AppColors.secondaryColor,
                      //   ),
                      //   title: const Text(
                      //     'Notifications',
                      //     style: AppTextStyles.subHeadingTextStyle1,
                      //   ),
                      //   onTap: () {
                      //     Get.toNamed(PageRoutes.notificationsScreen);
                      //   },
                      // ),
                      Get.find<GeneralController>()
                                      .storageBox
                                      .read('authToken') !=
                                  null &&
                              Get.find<GetAllSettingsController>()
                                      .getAllSettingsModel
                                      .data!
                                      .enableWalletSystem ==
                                  "1"
                          ? ListTile(
                              isThreeLine: false,
                              dense: true,
                              visualDensity: const VisualDensity(
                                  vertical: -1, horizontal: -3),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 0),
                              leading: const ImageIcon(
                                AssetImage("assets/icons/Wallet_alt.png"),
                                color: AppColors.secondaryColor,
                              ),
                              title:  Text(
                                getTranslated('wallet',context),
                                style: AppTextStyles.subHeadingTextStyle1,
                              ),
                              onTap: () {
                                Get.toNamed(PageRoutes.walletScreen);
                              },
                            )
                          : const SizedBox(),
                      ListTile(
                        isThreeLine: false,
                        dense: true,
                        visualDensity:
                            const VisualDensity(vertical: -1, horizontal: -3),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 0),
                        leading: const ImageIcon(
                          AssetImage("assets/icons/Folders_light.png"),
                          color: AppColors.secondaryColor,
                        ),
                        title: Text(
                          getTranslated('appointmentHistory',context),
                          style: AppTextStyles.subHeadingTextStyle1,
                        ),
                        onTap: Get.find<GeneralController>()
                                    .storageBox
                                    .read('authToken') !=
                                null
                            ? () {
                                Get.toNamed(
                                    PageRoutes.appointmentHistoryScreen);
                              }
                            : () {},
                      ),
                      ListTile(
                        isThreeLine: false,
                        dense: true,
                        visualDensity:
                            const VisualDensity(vertical: -1, horizontal: -3),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 0),
                        leading: const ImageIcon(
                          AssetImage("assets/icons/law-firms-icon.png"),
                          color: AppColors.secondaryColor,
                        ),
                        title:  Text(
                          getTranslated('lawFirms',context),
                          style: AppTextStyles.subHeadingTextStyle1,
                        ),
                        onTap: () {
                          Get.toNamed(PageRoutes.lawFirmsScreen);
                        },
                      ),
                      // ListTile(
                      //   isThreeLine: false,
                      //   dense: true,
                      //   visualDensity:
                      //       const VisualDensity(vertical: -1, horizontal: -3),
                      //   contentPadding: const EdgeInsets.symmetric(
                      //       horizontal: 12, vertical: 0),
                      //   leading: const ImageIcon(
                      //     AssetImage("assets/icons/services-icon.png"),
                      //     color: AppColors.secondaryColor,
                      //   ),
                      //   title: const Text(
                      //     'Quick Buy Services',
                      //     style: AppTextStyles.subHeadingTextStyle1,
                      //   ),
                      //   onTap: () {
                      //     Get.toNamed(PageRoutes.quickBuyServices);
                      //   },
                      // ),
                      ListTile(
                        isThreeLine: false,
                        dense: true,
                        visualDensity:
                            const VisualDensity(vertical: -1, horizontal: -3),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 0),
                        leading: const ImageIcon(
                          AssetImage("assets/icons/blog-icon.png"),
                          color: AppColors.secondaryColor,
                        ),
                        title:  Text(
                          getTranslated('blogs',context),
                          style: AppTextStyles.subHeadingTextStyle1,
                        ),
                        onTap: () {
                          Get.toNamed(PageRoutes.blogsScreen);
                        },
                      ),
                      ListTile(
                        isThreeLine: false,
                        dense: true,
                        visualDensity:
                            const VisualDensity(vertical: -1, horizontal: -3),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 0),
                        leading: const ImageIcon(
                          AssetImage("assets/icons/Group.png"),
                          color: AppColors.secondaryColor,
                        ),
                        title:Text(
                          getTranslated('aboutUs',context),
                          style: AppTextStyles.subHeadingTextStyle1,
                        ),
                        onTap: () {
                          Get.toNamed(PageRoutes.aboutusScreen);
                        },
                      ),
                      ListTile(
                        isThreeLine: false,
                        dense: true,
                        visualDensity:
                            const VisualDensity(vertical: -1, horizontal: -3),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 0),
                        leading: const ImageIcon(
                          AssetImage("assets/icons/Message.png"),
                          color: AppColors.secondaryColor,
                        ),
                        title: Text(
                          getTranslated('contactUs',context),
                          style: AppTextStyles.subHeadingTextStyle1,
                        ),
                        onTap: () {
                          Get.toNamed(PageRoutes.contactusScreen);
                        },
                      ),
                      ListTile(
                        isThreeLine: false,
                        dense: true,
                        visualDensity:
                            const VisualDensity(vertical: -1, horizontal: -3),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 0),
                        leading: const ImageIcon(
                          AssetImage("assets/icons/Chield_alt.png"),
                          color: AppColors.secondaryColor,
                        ),

                        title: Text(
                          getTranslated('privacyPolicy',context),
                          style: AppTextStyles.subHeadingTextStyle1,
                        ),
                        onTap: () {
                          Get.toNamed(PageRoutes.privacyPolicyScreen);
                        },
                      ),
                      Consumer<LocalizationProvider>(
                        builder: (context, provider ,child) {
                          return ListTile(
                            isThreeLine: false,
                            dense: true,
                            visualDensity:
                            const VisualDensity(vertical: -1, horizontal: -3),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 0),
                            leading: const Icon(Icons.language),
                            title: Text(
                              getTranslated('language',context),
                              style: AppTextStyles.subHeadingTextStyle1,
                            ),
                            onTap: () {
                              Get.toNamed(PageRoutes.privacyPolicyScreen);
                            },
                            trailing: DropdownButton<String>(
                              elevation: 0,
                              underline: SizedBox(),
                              value: _selectedLanguage,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedLanguage = newValue!;
                                   provider.setLanguage(Locale(newValue));

                                });
                               Navigator.push(context, MaterialPageRoute(builder: (context)=> SplashScreen()));


                                // Add logic to change the app language here
                              },
                              items: [
                                DropdownMenuItem<String>(
                                  value: 'en',
                                  child: Text('English'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'ar',
                                  child: Text('العربية'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      // ListTile(
                      //   isThreeLine: false,
                      //   dense: true,
                      //   visualDensity:
                      //       const VisualDensity(vertical: -1, horizontal: -3),
                      //   contentPadding: const EdgeInsets.symmetric(
                      //       horizontal: 12, vertical: 0),
                      //   leading: const ImageIcon(
                      //     AssetImage("assets/icons/setting-icon.png"),
                      //     color: AppColors.secondaryColor,
                      //   ),
                      //   title: const Text(
                      //     'Settings',
                      //     style: AppTextStyles.subHeadingTextStyle1,
                      //   ),
                      //   onTap: () {
                      //     Navigator.pop(context);
                      //   },
                      // ),
                      // ListTile(
                      //   isThreeLine: false,
                      //   dense: true,
                      //   visualDensity:
                      //       const VisualDensity(vertical: -1, horizontal: -3),
                      //   contentPadding: const EdgeInsets.symmetric(
                      //       horizontal: 12, vertical: 0),
                      //   leading: const ImageIcon(
                      //     AssetImage("assets/icons/language-icon.png"),
                      //     color: AppColors.secondaryColor,
                      //   ),
                      //   title: const Text(
                      //     'Languages',
                      //     style: AppTextStyles.subHeadingTextStyle1,
                      //   ),
                      //   onTap: () {
                      //     Navigator.pop(context);
                      //   },
                      // ),
                      Get.find<GeneralController>()
                                  .storageBox
                                  .read('authToken') !=
                              null
                          ? ListTile(
                              isThreeLine: false,
                              dense: true,
                              visualDensity: const VisualDensity(
                                  vertical: -1, horizontal: -3),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 0),
                              leading: const ImageIcon(
                                AssetImage("assets/icons/Sign_out_circle.png"),
                                color: AppColors.secondaryColor,
                              ),
                              title: Text(
                                getTranslated('logout',context),
                                style: AppTextStyles.subHeadingTextStyle1,
                              ),
                              onTap: () {
                                Get.find<GeneralController>()
                                    .updateFormLoaderController(true);
                                getMethod(context, signOutURL, null, true,
                                    signOutUserRepo);

                                // Get.toNamed(PageRoutes.homeScreen);
                              },
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavyBar(
            selectedIndex: Get.find<GeneralController>().bottomNavIndex,
            backgroundColor: AppColors.offWhite,
            showElevation: true,
            itemCornerRadius: 24,
            curve: Curves.easeIn,
            onItemSelected: (index) => setState(
                () => Get.find<GeneralController>().bottomNavIndex = index),
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                icon: const ImageIcon(
                  AssetImage("assets/icons/Group.png"),
                  size: 28,
                  color: AppColors.secondaryColor,
                ),
                title: Text(
                  getTranslated('lawyers',context),
                  style: AppTextStyles.bodyTextStyle2,
                ),
                activeColor: AppColors.primaryColor,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: const ImageIcon(
                  AssetImage("assets/icons/Home.png"),
                  size: 30,
                  color: AppColors.secondaryColor,
                ),
                title: Text(
                  getTranslated('home',context),
                  style: AppTextStyles.bodyTextStyle2,
                ),
                activeColor: AppColors.primaryColor,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: const ImageIcon(
                  AssetImage("assets/icons/File_dock.png"),
                  color: AppColors.secondaryColor,
                ),
                title: Text(
                  getTranslated('category',context),
                  style: AppTextStyles.bodyTextStyle2,
                ),
                activeColor: AppColors.primaryColor,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    });
  }
}
