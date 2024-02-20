import 'package:flutter/material.dart';
import 'package:lawyer_consultant/src/localization/language_constraints.dart';
import 'package:resize/resize.dart';

import '../config/app_colors.dart';
import '../config/app_text_styles.dart';

class SearchFilterWidget extends StatelessWidget {
  final VoidCallback onSearchTap;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  const SearchFilterWidget({
    super.key,
    required this.onSearchTap,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: getTranslated("searchYourExpert", context),
            hintStyle: AppTextStyles.hintTextStyle1,
            labelStyle: AppTextStyles.hintTextStyle1,
            isDense: true,
            contentPadding:
                EdgeInsets.symmetric(vertical: 0.h, horizontal: 0.w),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(5.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(5.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(5.0),
            ),
            prefixIcon: Image.asset(
              "assets/icons/Search_alt.png",
              scale: 1.5.h,
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4),
                  backgroundColor: AppColors.primaryColor,
                  // minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onPressed: onSearchTap,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text(
                      getTranslated("search", context),

                      style: AppTextStyles.buttonTextStyle2,
                    ),
                    // Image.asset(
                    //   "assets/icons/Filter_alt_fill.png",
                    // ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
