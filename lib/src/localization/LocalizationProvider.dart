import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../screens/home_screen.dart';
import 'LanguageRepo.dart';
import 'app_constants.dart';

class LocalizationProvider extends ChangeNotifier {

  final SharedPreferences? sharedPreferences;

  LocalizationProvider({required this.sharedPreferences}) {
    _loadCurrentLanguage();
  }

  int? _languageIndex;
  Locale _locale = Locale(AppConstants.languages[1].languageCode!, AppConstants.languages[1].countryCode);
  bool _isLtr = true;

  Locale get locale => _locale;
  bool get isLtr => _isLtr;
  int? get languageIndex => _languageIndex;

  void _loadCurrentLanguage() async {
    _locale = Locale(sharedPreferences!.getString(AppConstants.languageCode) ?? AppConstants.languages[1].languageCode!,
        sharedPreferences!.getString(AppConstants.countryCode) ?? AppConstants.languages[1].countryCode);
    _isLtr = _locale.languageCode != 'ar';
    notifyListeners();
  }

  void _saveLanguage(Locale locale) async {
    sharedPreferences!.setString(AppConstants.languageCode, locale.languageCode);
    sharedPreferences!.setString(AppConstants.countryCode, locale.countryCode!);
  }


  Future<void> setLanguage(Locale locale) async {
    _locale = locale;
    if(_locale.languageCode == 'ar') {
      _isLtr = false;
    }else {
      _isLtr = true;
    }
    for (var language in AppConstants.languages) {
      if(language.languageCode == _locale.languageCode) {
        _languageIndex = AppConstants.languages.indexOf(language);
      }
    }

    notifyListeners();

    _saveLanguage(_locale);

    notifyListeners();
  }


}