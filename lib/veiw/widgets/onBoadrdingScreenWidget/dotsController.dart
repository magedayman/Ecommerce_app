// ignore_for_file: camel_case_types, file_names

import 'package:e_commerce_app/controller/onBoadrding_controller.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class dotsController extends StatelessWidget {
  const dotsController({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<onBoardingControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(onBoardingList.length, (index) {
            return AnimatedContainer(
                height: 6,
                width: controller.currentPage == index ? 15 : 6,
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: controller.currentPage == index
                      ? appColors.blueGrey
                      : appColors.grey.withOpacity(0.2),
                ),
                duration: const Duration(milliseconds: 400));
          })
        ],
      ),
    );
  }
}
