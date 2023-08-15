// ignore_for_file: camel_case_types, file_names

import 'package:e_commerce_app/controller/onBoadrding_controller.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class customButtonOnBoarding extends GetView<onBoardingControllerImp> {
  const customButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50,
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            gradient: LinearGradient(
              colors: [
                appColors.accentblue.withOpacity(0.4),
                appColors.primaryColor.withOpacity(0.9),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
            )),
        child: Container(
          alignment: Alignment.bottomRight,
          child: IconButton(
              onPressed: () {
                controller.onNext();
              },
              icon: const Icon(
                color: appColors.white,
                Icons.navigate_next_outlined,
                size: 30,
              )),
        ));
  }
}


// MaterialButton(
//         textColor: appColors.white,
//         padding: const EdgeInsets.symmetric(horizontal: 100),
//         onPressed: () {
//           controller.onNext();
//         },
//         child: Text(
//           "10".tr,
//           style: const TextStyle(fontWeight: FontWeight.w700),
//         ),
//       ),