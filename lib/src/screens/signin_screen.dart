import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lawyer_consultant/src/config/app_colors.dart';
import 'package:lawyer_consultant/src/config/app_text_styles.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:resize/resize.dart';

import '../api_services/post_service.dart';
import '../api_services/urls.dart';

import '../controllers/general_controller.dart';
import '../controllers/pusher_beams_controller.dart';
import '../controllers/signin_controller.dart';

import '../localization/language_constraints.dart';
import '../repositories/signin_repo.dart';
import '../routes.dart';
import '../widgets/auth_text_form_field_widget.dart';
import '../widgets/button_widget.dart';

class SigninScreen extends StatefulWidget {
  SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final logic = Get.put(SigninController());
  final pusherLogic = Get.put(PusherBeamsController());

  bool boolValue = false;
  bool obscurePassword = true;

  final GlobalKey<FormState> _loginFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(builder: (generalController) {
      return GestureDetector(onTap: () {
        generalController.focusOut(context);
      }, child: GetBuilder<SigninController>(builder: (signInController) {
        return ModalProgressHUD(
            progressIndicator: const CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
            inAsyncCall: generalController.formLoaderController,
            child: Scaffold(
              backgroundColor: AppColors.offWhite,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 58, 18, 0),
                  child: Form(
                    key: _loginFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/law-hammer.png"),
                        const SizedBox(height: 28),
                         Text(
                          getTranslated( "welcomeBack", context),
                          style: AppTextStyles.bodyTextStyle8,
                        ),
                        const SizedBox(height: 4),
                         Text(
                          getTranslated("signInToYourAccount", context),
                          style: AppTextStyles.bodyTextStyle1,
                        ),
                        const SizedBox(height: 28),
                        AuthTextFormFieldWidget(
                          hintText:getTranslated('email', context),
                          prefixIconColor: AppColors.primaryColor,
                          prefixIcon: "assets/icons/Message.png",
                          controller: signInController.emailController,
                          onChanged: (value) {
                            signInController.emailValidator = null;
                            signInController.update();
                          },
                          validator: (value) {
                            if ((value ?? "").isEmpty) {
                              return 'Field Required';
                            }
                            if (!GetUtils.isEmail(value!)) {
                              return 'Please make sure your email address is valid';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        AuthPasswordFormFieldWidget(
                          hintText:getTranslated('password', context),
                          prefixIconColor: AppColors.primaryColor,
                          prefixIcon: "assets/icons/Unlock.png",
                          controller: signInController.passwordController,
                          onChanged: (value) {
                            signInController.passwordValidator = null;
                            signInController.update();
                          },
                          validator: (value) {
                            if ((value ?? "").isEmpty) {
                              return 'Field Required';
                            }
                            return null;
                          },
                          suffixIconOnTap: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                          suffixIcon: Icon(
                            obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 20.h,
                            color: AppColors.lightGrey,
                          ),
                          obsecureText: obscurePassword,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Row(
                            //   children: [
                            //     Checkbox(
                            //       value: boolValue,
                            //       tristate: false,
                            //       activeColor: AppColors.primaryColo
                            //       visualDensity: const VisualDensity(
                            //           horizontal: -2, vertical: 2),
                            //       shape: RoundedRectangleBorder(
                            //           borderRadius: BorderRadius.circular(5)),
                            //       side: const BorderSide(
                            //           color: AppColors.primaryColor),
                            //       onChanged: (bool? boolValue) {
                            //         // setState(() {
                            //         //   this.boolValue = boolValue!;
                            //         // });
                            //       },
                            //     ),
                            //     const Text(
                            //       "Remember",
                            //       style: AppTextStyles.bodyTextStyle11,
                            //     )
                            //   ],
                            // ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(PageRoutes.forgotPasswordScreen);
                              },
                              child:  Text(
                                getTranslated( "forgotPassword", context),
                                style: AppTextStyles.buttonTextStyle3,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        ButtonWidgetOne(
                          borderRadius: 10,
                          buttonColor: AppColors.primaryColor,
                          buttonText: getTranslated('login', context),
                          buttonTextStyle: AppTextStyles.buttonTextStyle1,
                          onTap: () {
                            if (_loginFormKey.currentState!.validate()) {
                              generalController.focusOut(context);
                              generalController
                                  .updateFormLoaderController(true);
                              postMethod(
                                  context,
                                  signInWithEmailURL,
                                  {
                                    'email':
                                        signInController.emailController.text,
                                    'password': signInController
                                        .passwordController.text,
                                    'login_as': "customer"
                                  },
                                  true,
                                  signInWithEmailRepo);
                            }
                          },
                        ),
                        const SizedBox(height: 28),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(PageRoutes.signupScreen);
                          },
                          child:  Text(
                              getTranslated("createAccount", context),
                              style: AppTextStyles.underlineTextStyle1),
                        ),
                        const SizedBox(height: 18),
                        Row(
                          children:  [
                            Expanded(child: Divider(color: AppColors.grey)),
                            Expanded(
                              child: Center(
                                child: Text(
                                  getTranslated( "or", context),
                                  style: AppTextStyles.bodyTextStyle7,
                                ),
                              ),
                            ),
                            Expanded(child: Divider(color: AppColors.grey)),
                          ],
                        ),
                        SizedBox(height: 18.h),
                        ButtonWidgetThree(
                          buttonIcon: "assets/icons/Google.png",
                          buttonText:  getTranslated("loginViaGoogle", context),
                          iconHeight: 25.h,
                          onTap: () {
                            signInController.signInWithGoogle();
                          },
                        ),
                        SizedBox(height: 14.h),
                        ButtonWidgetThree(
                          buttonIcon: "assets/icons/Facebook.png",
                          buttonText:  getTranslated("loginViaFacebook", context),
                          iconHeight: 25.h,
                          onTap: () {
                            signInController.signinWithFacebook();
                          },
                        ),
                        SizedBox(height: 18.h),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      }));
    });
  }
}
