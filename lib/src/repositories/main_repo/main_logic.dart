import 'package:get/get.dart';
import 'package:lawyer_consultant/src/repositories/main_repo/terms_condition_model.dart';

import 'get_config_credential_model.dart';
import 'get_general_setting_model.dart';

class MainLogic extends GetxController {
  GetConfigCredentialModel getConfigCredentialModel =
      GetConfigCredentialModel();
  GetGeneralSettingModel getGeneralSettingModel = GetGeneralSettingModel();
  TermsConditionModel termsConditionModel = TermsConditionModel();
}
