import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resize/resize.dart';

import '../api_services/urls.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../controllers/general_controller.dart';
import '../widgets/background_widgets/call_screen_background_widget.dart';

class IncomingCallScreen extends StatelessWidget {
  final String callingUserName, image, incomingCallType;
  final VoidCallback callAcceptOnTap, callRejectOnTap;
  const IncomingCallScreen({
    super.key,
    required this.callingUserName,
    required this.image,
    required this.callAcceptOnTap,
    required this.callRejectOnTap,
    required this.incomingCallType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(child: CallBackgroundWidget()),
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 60.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  incomingCallType,
                  style: AppTextStyles.bodyTextStyle5,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      '$mediaUrl${Get.find<GeneralController>().currentUserModel!.loginInfo!.image}'),
                  radius: 75.h,
                ),
                Text(
                  callingUserName,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyTextStyle14,
                ),
                SizedBox(height: 70.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: callAcceptOnTap,
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.green,
                        child: Icon(
                          Icons.call,
                          color: AppColors.white,
                          size: 25,
                        ),
                      ),
                    ),
                    SizedBox(width: 70.w),
                    InkWell(
                      onTap: callRejectOnTap,
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.call_end,
                          color: AppColors.white,
                          size: 25,
                        ),
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: callAcceptOnTap,
                    //   child: Image.asset(
                    //     "assets/icons/accept 1.png",
                    //     height: 55.h,
                    //   ),
                    // ),

                    // GestureDetector(
                    //   onTap: callRejectOnTap,
                    //   child: Image.asset(
                    //     "assets/icons/reject 1.png",
                    //     height: 55.h,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
