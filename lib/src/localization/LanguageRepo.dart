

import 'package:flutter/material.dart';

import '../models/LanguageModel.dart';
import 'app_constants.dart';

class LanguageRepo {

  List<LanguageModel> getAllLanguages({BuildContext? context}) {
    return AppConstants.languages;
  }


}
