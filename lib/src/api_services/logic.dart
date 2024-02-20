import 'package:get/get.dart';

class ApiController extends GetxController {
  // GetStorage storageBox = GetStorage();

  ///-------------------------------internet-check
  bool internetChecker = true;
  changeInternetCheckerState(bool value) {
    internetChecker = value;
    update();
  }
}
