import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../config/app_colors.dart';
import '../config/app_text_styles.dart';

import '../localization/language_constraints.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/button_widget.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarWidget(
          leadingIcon: 'assets/icons/Expand_left.png',
          leadingOnTap: () {
            Get.back();
          },
          richTextSpan: TextSpan(
            text: getTranslated('contactUs',context),
            style: AppTextStyles.appbarTextStyle2,
            children: <TextSpan>[],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset("assets/images/contactus-banner.png"),
              ),
              const SizedBox(height: 18),
              const Text(
                "Submit your Querries",
                style: AppTextStyles.headingTextStyle4,
              ),
              const SizedBox(height: 18),
              // const TextFormFieldWidget(
              //   hintText: '* First Name',
              // ),
              // const SizedBox(height: 14),
              // const TextFormFieldWidget(
              //   hintText: '* Last Name',
              // ),
              // const SizedBox(height: 14),
              // const TextFormFieldWidget(
              //   hintText: '* Email',
              // ),
              // const SizedBox(height: 14),
              // const TextFormFieldWidget(
              //   hintText: '* Subject',
              // ),
              const SizedBox(height: 14),
              TextField(
                style: AppTextStyles.hintTextStyle1,
                maxLines: 5,
                // controller: controller,
                decoration: InputDecoration(
                  hintText: "Message Here",
                  hintStyle: AppTextStyles.hintTextStyle1,
                  labelStyle: AppTextStyles.hintTextStyle1,
                  contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                  isDense: true,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1, color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1, color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1, color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1, color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ButtonWidgetOne(
                  onTap: () {},
                  buttonText: "Submit",
                  buttonTextStyle: AppTextStyles.bodyTextStyle8,
                  borderRadius: 10,
                  buttonColor: AppColors.primaryColor),
            ],
          ),
        ),
      ),
    );
  }
}
