// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, sort_child_properties_last, camel_case_types, file_names, unnecessary_import

import 'dart:ui';

import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/constant/appRoutes.dart';
import 'package:e_commerce_app/core/localizition/changeLocal.dart';
import 'package:e_commerce_app/veiw/widgets/authWidget/authLogo.dart';
import 'package:e_commerce_app/veiw/widgets/languagesWidgets/customBackgroundPostioned.dart';
import 'package:e_commerce_app/veiw/widgets/languagesWidgets/customButtonLang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends GetView<ChangeLocal> {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.white,
      body: Container(
          child: Stack(
        children: [
          const customBackgroundPostioned(
              color: Color.fromARGB(255, 0, 81, 95), top: 90, left: -90),
          const customBackgroundPostioned(
              color: Color.fromARGB(255, 206, 169, 169),
              bottom: 90,
              right: -100),
          Positioned(
            top: 50,
            left: Get.width / 5,
            right: Get.width / 5,
            child: Center(
                child: Container(
                    width: 300, height: 300, child: const AuthLogo())),
          ),
          SafeArea(
              child: Center(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "1".tr,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              customButtonLang(
                  title: "Ar",
                  onPressed: () {
                    controller.changeLocal("ar");
                    Get.toNamed(appRoutes.onBoardingRoute);
                  }),
              const SizedBox(height: 10),
              customButtonLang(
                  title: "En",
                  onPressed: () {
                    controller.changeLocal("en");
                    Get.toNamed(appRoutes.onBoardingRoute);
                  }),
            ],
          )))
        ],
      )),
    );
  }
}
