import 'package:e_commerce_app/core/constant/appthem.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeLocal extends GetxController {
  appServices appservices = Get.find();

  Locale? currentLanguage;

  ThemeData themeApp = appEnglishTheme;

  changeLocal(String langcode) {
    Locale locale = Locale(langcode);
    appservices.sharedpreferance.setString("lang", langcode);
    themeApp = langcode == "ar" ? appArabicTheme : appEnglishTheme;
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedprefLangCode = appservices.sharedpreferance.getString("lang");

    if (sharedprefLangCode == "ar") {
      currentLanguage = const Locale("ar");
      themeApp = appArabicTheme;
    } else if (sharedprefLangCode == "en") {
      currentLanguage = const Locale("en");
      themeApp = appEnglishTheme;
    } else {
      currentLanguage = Locale(Get.deviceLocale!.languageCode);
    }

    super.onInit();
  }
}
