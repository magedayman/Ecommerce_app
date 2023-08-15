// ignore_for_file: camel_case_types, file_names, unnecessary_import, must_call_super

import 'package:e_commerce_app/core/constant/appRoutes.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class onBoardingContoller extends GetxController {
  onNext();
  onPageChanged(int index);
}

class onBoardingControllerImp extends onBoardingContoller {
  int currentPage = 0;

  late PageController pagecontroller;

  appServices appService = Get.find();

  @override
  void onInit() {
    pagecontroller = PageController();
  }

  @override
  onNext() {
    currentPage++;
    // to intent to the login page when slider finished . we must deduct 1 from onBoardingList.length to get count 3

    if (currentPage > onBoardingList.length - 1) {
      appService.sharedpreferance.setString("step", "1");
      Get.offAllNamed(appRoutes.loginRoute);
    } else {
      pagecontroller.animateToPage(currentPage,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }
}
