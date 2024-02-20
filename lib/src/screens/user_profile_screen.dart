import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'package:lawyer_consultant/src/repositories/edit_user_profile_repo.dart';
import 'package:lawyer_consultant/src/widgets/button_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:resize/resize.dart';

import '../api_services/post_service.dart';
import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../controllers/edit_profile_controller.dart';
import '../controllers/general_controller.dart';

import '../localization/language_constraints.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/text_form_field_widget.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => UserProfileScreenState();
}

class UserProfileScreenState extends State<UserProfileScreen> {
  final GlobalKey<FormState> _userProfileUpdateFormKey = GlobalKey();
  final editUserProfileLogic = Get.put(EditUserProfileController());
  final generalLogic = Get.put(GeneralController());

  @override
  void initState() {
    super.initState();
    // getMethod(context, getLoggedInUserUrl, null, true, loggedInUserRepo);
    editUserProfileLogic.userProfileFirstNameController.text =
        generalLogic.currentUserModel!.loginInfo!.firstName ?? '';

    editUserProfileLogic.userProfileLastNameController.text =
        generalLogic.currentUserModel!.loginInfo!.lastName ?? '';

    editUserProfileLogic.userProfileUserNameController.text =
        generalLogic.currentUserModel!.loginInfo!.userName ?? '';

    editUserProfileLogic.userProfileDescriptionController.text =
        generalLogic.currentUserModel!.loginInfo!.description ?? '';

    editUserProfileLogic.userProfileAddressLine1Controller.text =
        generalLogic.currentUserModel!.loginInfo!.addressLine1 ?? '';

    editUserProfileLogic.userProfileZipCodeController.text =
        generalLogic.currentUserModel!.loginInfo!.zipCode ?? '';

    // editUserProfileLogic.uploadedProfileImage =
    //     generalLogic.currentUserModel!.loginInfo!.image;

    log("${generalLogic.currentUserModel!.loginInfo!.image} Log Image");
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(builder: (generalController) {
      return GetBuilder<EditUserProfileController>(
          builder: (editUserProfileController) {
        return ModalProgressHUD(
            progressIndicator: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
            ),
            inAsyncCall: generalController.formLoaderController,
            child: GestureDetector(
              onTap: () {
                final FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: Scaffold(
                backgroundColor: AppColors.white,
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(56),
                  child: AppBarWidget(
                    richTextSpan:  TextSpan(
                      text: getTranslated('profile',context),
                      style: AppTextStyles.appbarTextStyle2,
                      children: <TextSpan>[],
                    ),
                    leadingIcon: "assets/icons/Expand_left.png",
                    leadingOnTap: () {
                      Get.back();
                    },
                  ),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
                    child: Form(
                      key: _userProfileUpdateFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: AppColors.gradientOne,
                            ),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    imagePickerDialog(context);
                                  },
                                  child: editUserProfileLogic.profileImage ==
                                          null
                                      ? generalLogic.currentUserModel == null
                                          ? Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      20, 20, 20, 20),
                                              decoration: BoxDecoration(
                                                  color: AppColors.offWhite,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: AppColors
                                                          .primaryColor)),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                      "assets/icons/Upload_duotone_line.png"),
                                                  const SizedBox(height: 4),
                                                  const Text(
                                                    "Upload image",
                                                    style: AppTextStyles
                                                        .bodyTextStyle1,
                                                  )
                                                ],
                                              ),
                                            )
                                          : generalLogic.currentUserModel!
                                                      .loginInfo!.image ==
                                                  null
                                              ? Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          20, 20, 20, 20),
                                                  decoration: BoxDecoration(
                                                      color: AppColors.offWhite,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          color: AppColors
                                                              .primaryColor)),
                                                  child: Column(
                                                    children: [
                                                      Image.asset(
                                                          "assets/icons/Upload_duotone_line.png"),
                                                      const SizedBox(height: 4),
                                                      const Text(
                                                        "Upload image",
                                                        style: AppTextStyles
                                                            .bodyTextStyle1,
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                  child: Image.network(
                                                    scale: 4.h,
                                                    '$mediaUrl${generalLogic.currentUserModel!.loginInfo!.image}',
                                                    fit: BoxFit.cover,
                                                    height: 110.h,
                                                    width: 120.w,
                                                  ))
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          child: Image.file(
                                            scale: 3.h,
                                            // '$mediaUrl${generalLogic.currentUserModel!.loginInfo!.image}',
                                            editUserProfileLogic.profileImage!,
                                            height: 110.h,
                                            width: 120.w,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      generalController.storageBox
                                                  .read('authToken') !=
                                              null
                                          ? "${generalController.currentUserModel!.loginInfo!.firstName} ${generalController.currentUserModel!.loginInfo!.lastName}"
                                          : "",
                                      style: AppTextStyles.bodyTextStyle5,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      generalController.storageBox
                                                  .read('authToken') !=
                                              null
                                          ? "${generalController.currentUserModel!.email}"
                                          : "",
                                      style: AppTextStyles.bodyTextStyle6,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 18),
                          TextFormFieldWidget(
                            hintText: '* First Name',
                            controller: editUserProfileController
                                .userProfileFirstNameController,
                            // initialText: editUserProfileLogic
                            //     .userProfileFirstNameController.text,
                            onChanged: (String? value) {
                              editUserProfileController
                                      .userProfileFirstNameController.text ==
                                  value;
                              editUserProfileController.update();
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'First Name Field Required';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 14),
                          TextFormFieldWidget(
                            hintText: '* Last Name',
                            controller: editUserProfileController
                                .userProfileLastNameController,
                            onChanged: (String? value) {
                              editUserProfileController
                                      .userProfileLastNameController.text ==
                                  value;
                              editUserProfileController.update();
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Last Name Field Required';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 14),
                          TextFormFieldWidget(
                            hintText: '* User Name',
                            controller: editUserProfileController
                                .userProfileUserNameController,
                            onChanged: (String? value) {
                              editUserProfileController
                                      .userProfileUserNameController.text ==
                                  value;
                              editUserProfileController.update();
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'User Name Field Required';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 14),
                          TextFormFieldWidget(
                            hintText: '* Description',
                            controller: editUserProfileController
                                .userProfileDescriptionController,
                            // initialText: editUserProfileController
                            //         .userProfileDescriptionController
                            //         .text
                            //         .isEmpty
                            //     ? ''
                            //     : editUserProfileController
                            //         .userProfileDescriptionController.text,
                            onChanged: (String? value) {
                              editUserProfileController
                                      .userProfileDescriptionController.text ==
                                  value;
                              editUserProfileController.update();
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Description Field Required';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 14),
                          TextFormFieldWidget(
                            hintText: '* Address Line 1',
                            controller: editUserProfileController
                                .userProfileAddressLine1Controller,
                            onChanged: (String? value) {
                              editUserProfileController
                                      .userProfileAddressLine1Controller.text ==
                                  value;
                              editUserProfileController.update();
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Address Line 1 Field Required';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 14),
                          TextFormFieldWidget(
                            hintText: '* Zip Code',
                            controller: editUserProfileController
                                .userProfileZipCodeController,
                            onChanged: (String? value) {
                              editUserProfileController
                                      .userProfileZipCodeController.text ==
                                  value;
                              editUserProfileController.update();
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Zip Code Field Required';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 24),
                          ButtonWidgetOne(
                              onTap: () async {
                                ///---keyboard-close
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);
                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                                if (_userProfileUpdateFormKey.currentState!
                                    .validate()) {
                                  if (editUserProfileController.profileImage !=
                                      null) {
                                    log("${editUserProfileController.profileImage!.path} Inside If");
                                    Get.find<GeneralController>()
                                        .updateFormLoaderController(true);
                                    // postMethod(
                                    //     context,
                                    //     editUserProfileURL,
                                    //     {
                                    //       "logged_in_as": "customer",
                                    //       "first_name": editUserProfileController
                                    //           .userProfileFirstNameController
                                    //           .text,
                                    //       "last_name": editUserProfileController
                                    //           .userProfileLastNameController
                                    //           .text,
                                    //       "user_name": editUserProfileController
                                    //           .userProfileUserNameController
                                    //           .text,
                                    //       "description": editUserProfileController
                                    //           .userProfileDescriptionController
                                    //           .text,
                                    //       "address_line_1":
                                    //           editUserProfileController
                                    //               .userProfileAddressLine1Controller
                                    //               .text,
                                    //       "zip_code": editUserProfileController
                                    //           .userProfileZipCodeController
                                    //           .text,
                                    //       "image": editUserProfileController
                                    //           .profileImage!.path,
                                    //       "lawyer_categories": "1",
                                    //     },
                                    //     true,
                                    //     editUserProfileDataRepo);
                                    editUserProfileImageRepo(
                                      editUserProfileController
                                          .userProfileFirstNameController.text,
                                      editUserProfileController
                                          .userProfileLastNameController.text,
                                      editUserProfileController
                                          .userProfileUserNameController.text,
                                      editUserProfileController
                                          .userProfileDescriptionController
                                          .text,
                                      editUserProfileController
                                          .userProfileZipCodeController.text,
                                      editUserProfileController
                                          .userProfileAddressLine1Controller
                                          .text,
                                      editUserProfileController.profileImage,
                                    );
                                  } else if (generalLogic.currentUserModel!
                                              .loginInfo!.image !=
                                          null &&
                                      editUserProfileController.profileImage ==
                                          null) {
                                    log(editUserProfileController
                                        .userProfileFirstNameController.text);
                                    log(editUserProfileController
                                        .userProfileLastNameController.text);
                                    log(editUserProfileController
                                        .userProfileUserNameController.text);
                                    log(editUserProfileController
                                        .userProfileDescriptionController.text);
                                    log(editUserProfileController
                                        .userProfileZipCodeController.text);
                                    log(editUserProfileController
                                        .userProfileAddressLine1Controller
                                        .text);
                                    // log(editUserProfileController
                                    //     .profileImage!.path);
                                    Get.find<GeneralController>()
                                        .updateFormLoaderController(true);
                                    postMethod(
                                        context,
                                        editUserProfileURL,
                                        {
                                          "logged_in_as": "customer",
                                          "first_name": editUserProfileController
                                              .userProfileFirstNameController
                                              .text,
                                          "last_name": editUserProfileController
                                              .userProfileLastNameController
                                              .text,
                                          "user_name": editUserProfileController
                                              .userProfileUserNameController
                                              .text,
                                          "description": editUserProfileController
                                              .userProfileDescriptionController
                                              .text,
                                          "address_line_1":
                                              editUserProfileController
                                                  .userProfileAddressLine1Controller
                                                  .text,
                                          "zip_code": editUserProfileController
                                              .userProfileZipCodeController
                                              .text,
                                          // "image": generalLogic
                                          //     .currentUserModel!
                                          //     .loginInfo!
                                          //     .image,
                                          "lawyer_categories": "1",
                                        },
                                        true,
                                        editUserProfileDataRepo);
                                  } else {
                                    showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return CustomDialogBox(
                                            title: 'Sorry',
                                            titleColor: AppColors
                                                .customDialogErrorColor,
                                            descriptions: 'Inside Screen Popup',
                                            text: 'Ok',
                                            functionCall: () {
                                              Navigator.pop(context);
                                            },
                                            img:
                                                'assets/icons/dialog_error.png',
                                          );
                                        });
                                  }
                                }

                                // if (_userProfileUpdateFormKey.currentState!
                                //     .validate()) {
                                //   log(editUserProfileController
                                //       .userProfileFirstNameController.text);
                                //   log(editUserProfileController
                                //       .userProfileLastNameController.text);
                                //   log(editUserProfileController
                                //       .userProfileUserNameController.text);
                                //   log(editUserProfileController
                                //       .userProfileDescriptionController.text);
                                //   log(editUserProfileController
                                //       .userProfileZipCodeController.text);
                                //   log(editUserProfileController
                                //       .userProfileAddressLine1Controller.text);

                                //   ///loader
                                //   Get.find<GeneralController>()
                                //       .updateFormLoaderController(true);

                                //   ///post-method
                                //   postMethod(
                                //       context,
                                //       editUserProfileURL,
                                //       {
                                //         // "logged_in_as": "customer",
                                //         "first_name": editUserProfileController
                                //             .userProfileFirstNameController
                                //             .text,
                                //         "last_name": editUserProfileController
                                //             .userProfileLastNameController.text,
                                //         "user_name": editUserProfileController
                                //             .userProfileUserNameController.text,
                                //         "description": editUserProfileController
                                //             .userProfileDescriptionController
                                //             .text,
                                //         "address_line_1":
                                //             editUserProfileController
                                //                 .userProfileAddressLine1Controller
                                //                 .text,
                                //         "zip_code": editUserProfileController
                                //             .userProfileZipCodeController.text,
                                //         "lawyer_categories": "1",
                                //       },
                                //       true,
                                //       editUserProfileDataRepo);
                                // }
                              },
                              buttonText: "Save Profile",
                              buttonTextStyle: AppTextStyles.bodyTextStyle8,
                              borderRadius: 10,
                              buttonColor: AppColors.primaryColor),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
      });
    });
  }

  void imagePickerDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            actions: <Widget>[
              CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () async {
                    Navigator.pop(context);
                    setState(() {
                      Get.find<EditUserProfileController>().profileImagesList =
                          [];
                    });
                    Get.find<EditUserProfileController>().profileImagesList.add(
                        await ImagePickerGC.pickImage(
                            enableCloseButton: true,
                            context: context,
                            source: ImgSource.Camera,
                            barrierDismissible: true,
                            imageQuality: 10,
                            maxWidth: 400,
                            maxHeight: 600));
                    setState(() {
                      Get.find<EditUserProfileController>().profileImage = File(
                          Get.find<EditUserProfileController>()
                              .profileImagesList[0]
                              .path);
                    });
                  },
                  child: Text(
                    'camera',
                    style: AppTextStyles.buttonTextStyle8,
                  )),
              CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () async {
                    Navigator.pop(context);
                    setState(() {
                      Get.find<EditUserProfileController>().profileImagesList =
                          [];
                    });
                    Get.find<EditUserProfileController>().profileImagesList.add(
                        await ImagePickerGC.pickImage(
                            enableCloseButton: true,
                            context: context,
                            source: ImgSource.Gallery,
                            barrierDismissible: true,
                            imageQuality: 10,
                            maxWidth: 400,
                            maxHeight: 600));
                    setState(() {
                      Get.find<EditUserProfileController>().profileImage = File(
                          Get.find<EditUserProfileController>()
                              .profileImagesList[0]
                              .path);
                    });
                  },
                  child: Text(
                    'gallery',
                    style: AppTextStyles.buttonTextStyle8,
                  )),
            ],
          );
        });
  }
}
