// ignore_for_file: camel_case_types, file_names, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:e_commerce_app/controller/onBoadrding_controller.dart';
import 'package:e_commerce_app/veiw/widgets/onBoadrdingScreenWidget/customButton.dart';
import 'package:e_commerce_app/veiw/widgets/onBoadrdingScreenWidget/mainCustomSlider.dart';
import 'package:e_commerce_app/veiw/widgets/onBoadrdingScreenWidget/dotsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class onBoardingScreen extends StatelessWidget {
  const onBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(
        onBoardingControllerImp()); // indpendncy injection to the onBoardingControllerImp class

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: SafeArea(
              child: const customSlider(),
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  dotsController(),
                  Spacer(
                    flex: 2,
                  ),
                  Container(
                      alignment: Alignment.bottomRight,
                      child: customButtonOnBoarding())
                ],
              ))
        ],
      ),
    );
  }
}
