import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:lawyer_consultant/src/api_services/post_service.dart';
import 'package:lawyer_consultant/src/api_services/urls.dart';
import 'package:lawyer_consultant/src/config/app_configs.dart';
import 'package:resize/resize.dart';

import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../repositories/stripe_payment_repo.dart';
import '../routes.dart';
import '../widgets/button_widget.dart';
import 'lawyer_book_appointment_controller.dart';

class StripePaymentController extends GetxController {
  static StripePaymentController instance = Get.find();
  Map<String, dynamic>? paymentIntent;
  BuildContext? context;
  String SECRET_KEY = AppConfigs.stripeSecret;
  Future<void> makePayment(
      int? lawyerId,
      String? question,
      int? appointmentTypeId,
      String? date,
      int? appointmentScheduleId,
      String? appointmentType,
      String? attachment) async {
    try {
      paymentIntent = await createPaymentIntent(
          Get.find<LawyerAppointmentScheduleController>()
              .getLawyerAppointmentScheduleModel
              .data!
              .schedule!
              .fee!
              .toString(),
          'USD');
      //Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent!['client_secret'],
                  // applePay: const PaymentSheetApplePay(merchantCountryCode: '+92',),
                  // googlePay: const PaymentSheetGooglePay(testEnv: true, currencyCode: "US", merchantCountryCode: "+92"),
                  style: ThemeMode.dark,
                  merchantDisplayName: 'Law Adviser'))
          .then((value) {});

      ///now finally display payment sheeet
      try {
        await Stripe.instance.presentPaymentSheet().then((value) {
          // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("paid successfully")));

          postMethod(
              Get.context!,
              customerBookAppointment,
              {
                "lawyer_id": lawyerId,
                "question": question,
                "appointment_type_id": appointmentTypeId,
                "date": date,
                "appointment_schedule_id": appointmentScheduleId,
                "appointment_type": appointmentType,
                "attachment": attachment,
                "gateway": "razorpay",
              },
              true,
              stripePaymentRepo);
          paymentIntent = null;
        }).onError((error, stackTrace) {
          print('Error is:--->$error $stackTrace');
        });
      } on StripeException catch (e) {
        print('Error is:---> $e');
        showDialog(
            context: context!,
            builder: (_) => const AlertDialog(
                  content: Text("Cancelled "),
                ));
      } catch (e) {
        print('$e');
      }
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then(
        (value) {
          Get.defaultDialog(
              barrierDismissible: false,
              title: "",
              titlePadding: EdgeInsets.zero,
              content: Padding(
                padding: EdgeInsets.fromLTRB(18.w, 0, 18.w, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.offWhite,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 36.h, 0, 24.h),
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primaryColor),
                            child: const Icon(
                              Icons.check,
                              size: 36,
                              color: AppColors.offWhite,
                            ),
                          ),
                          const Text(
                            "Thank You",
                            style: AppTextStyles.headingTextStyle3,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "For your payment \$ ${Get.find<LawyerAppointmentScheduleController>().getLawyerAppointmentScheduleModel.data!.schedule!.fee!}",
                            style: AppTextStyles.bodyTextStyle2,
                          ),
                          SizedBox(height: 36.h),
                        ],
                      ),
                    ),
                    SizedBox(height: 36.h),
                    ButtonWidgetOne(
                        onTap: () {
                          // setState(() {
                          //   indexPage++;
                          // });
                          // Get.off(PageRoutes.appointmentHistoryScreen);

                          Get.toNamed(PageRoutes.appointmentHistoryScreen);
                        },
                        buttonText: "My Appointments Test",
                        buttonTextStyle: AppTextStyles.bodyTextStyle8,
                        borderRadius: 12,
                        buttonColor: AppColors.primaryColor),
                  ],
                ),
              ),
              radius: 18);

          paymentIntent = null;
        },
      ).onError((error, stackTrace) {
        print('Error is:--->$error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      showDialog(
          context: context!,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled "),
              ));
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
        Uri.parse(stripePaymentUrl),
        headers: {
          'Authorization': 'Bearer $SECRET_KEY',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      // ignore: avoid_print
      print('Payment Intent Body->>> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      // ignore: avoid_print
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 100;
    return calculatedAmout.toString();
  }
}
