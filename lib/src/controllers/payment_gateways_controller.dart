import 'package:get/get.dart';
import 'package:lawyer_consultant/src/models/get_payment_gateways_model.dart';

class PaymentGatewaysController extends GetxController {
  GetPaymentGatewaysModel getPaymentGatewaysModel = GetPaymentGatewaysModel();
  GetPaymentGatewaysDataModel getPaymentGatewaysDataModel =
      GetPaymentGatewaysDataModel();

  bool getPaymentGatewaysLoader = false;
  updatePaymentGatewaysLoader(bool newValue) {
    getPaymentGatewaysLoader = newValue;
    update();
  }
}
