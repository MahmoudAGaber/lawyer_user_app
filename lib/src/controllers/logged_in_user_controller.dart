import 'package:get/get.dart';
import '../models/logged_in_user_model.dart';

class LoggedInUserController extends GetxController {
  GetLoggedInUserModel loggedInUserModel =
      GetLoggedInUserModel(); //  for saving login-data
  GetLoggedInUserDataModel getloggedInUserDataModel =
      GetLoggedInUserDataModel(); //  for saving login-data
}
