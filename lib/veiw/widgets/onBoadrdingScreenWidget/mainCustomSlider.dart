// ignore_for_file: camel_case_types, sized_box_for_whitespace, void_checks, file_names

import 'package:e_commerce_app/controller/onBoadrding_controller.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class customSlider extends GetView<onBoardingControllerImp> {
  const customSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pagecontroller,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            const SizedBox(height: 25),
            Text(
              "${onBoardingList[index].title}",
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: appColors.blue),
            ),
            const SizedBox(height: 5),
            Container(
              width: double.infinity,
              height: Get.width / 0.9,
              child: Image.asset(
                fit: BoxFit.fill,
                "${onBoardingList[index].image}",
              ),
            ),
            const SizedBox(height: 20),
            Text(
              textAlign: TextAlign.center,
              "${onBoardingList[index].boady}",
              style: const TextStyle(
                  height: 2,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: appColors.grey),
            )
          ],
        );
      },
    );
  }
}
