import 'package:e_commerce_app/controller/HomeController/HomepageController.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomHomeCard extends GetView<HomepageControllerImp> {
  final String title;
  final String body;
  const CustomHomeCard({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: 160,
            decoration: BoxDecoration(
                gradient: controller.lang == "ar"
                    ? const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                            appColors.primaryColor,
                            appColors.accentblue,
                          ])
                    : const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.centerRight,
                        colors: [
                            appColors.primaryColor,
                            appColors.accentblue,
                          ]),
                borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: appColors.white),
                ),
              ),
              subtitle: Text(
                body,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: appColors.white, fontSize: 24),
              ),
            ),
          ),
          Positioned(
            top: -15,
            right: controller.lang == "en" ? -20 : null,
            left: controller.lang == "ar" ? -20 : null,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: appColors.primaryColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(150),
              ),
            ),
          )
        ],
      ),
    );
  }
}
