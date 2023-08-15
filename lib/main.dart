// ignore_for_file: unused_import
import 'dart:developer';
import 'package:e_commerce_app/Binding.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/localizition/Translation.dart';
import 'package:e_commerce_app/core/localizition/changeLocal.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/routes.dart';
import 'package:e_commerce_app/veiw/screens/LanguageScreen.dart';
import 'package:e_commerce_app/veiw/screens/onBoardingScreen.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await intialappServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //to chnage local from localcontroller...
    ChangeLocal changeLocal = Get.put(ChangeLocal());
    // ...............
    return GetMaterialApp(
      // multilanguages .....
      translations: appTranslation(),
      locale: changeLocal.currentLanguage,

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: changeLocal.themeApp,
      initialBinding: AppBinding(),
      getPages: routes,
    );
  }
}
