import 'package:e_commerce_app/controller/SettingsScreenController.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/constant/appRoutes.dart';
import 'package:e_commerce_app/core/constant/imageAssets.dart';
import 'package:e_commerce_app/core/functions/appAlertExit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends GetView<SettingsScreenControllerImp> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsScreenControllerImp());
    return Scaffold(
        backgroundColor: Colors.blueGrey.withOpacity(0.001),
        body: ListView(
          children: [
            Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          appColors.primaryColor,
                          appColors.primaryColor.withOpacity(0.3)
                        ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    height: Get.height / 4.5,
                  ),
                  Positioned(
                      top: Get.width / 3.0,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: appColors.white,
                            borderRadius: BorderRadius.circular(100)),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: appColors.grey.withOpacity(0.1),
                          backgroundImage:
                              const AssetImage(AppimageAssets.imageSliderThree),
                        ),
                      ))
                ]),
            const SizedBox(
              height: 80,
            ),
            Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                        title: const Text("Notifictions"),
                        subtitle: const Text("read more "),
                        trailing: Switch(
                          activeColor: appColors.primaryColor,
                          value: true,
                          onChanged: (value) {},
                        )),
                  ),
                  const Divider(
                    height: 10,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onTap: () {
                          Get.toNamed(appRoutes.viewAddress);
                        },
                        title: const Text("Address"),
                        subtitle: const Text("choese your address"),
                        trailing: const Icon(
                          Icons.add_location_outlined,
                          color: appColors.primaryColor,
                          size: 30,
                        )),
                  ),
                  const Divider(
                    height: 10,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onTap: () {
                          Get.toNamed(appRoutes.orderArchive);
                        },
                        title: const Text("orders deliverd"),
                        subtitle:
                            const Text("the orders deliverd successfully"),
                        trailing: const Icon(
                          Icons.check_circle_outlined,
                          color: appColors.primaryColor,
                          size: 30,
                        )),
                  ),
                  const Divider(
                    height: 10,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onTap: () async {
                          await launchUrl(Uri.parse("tel:+01289918389"));
                        },
                        title: const Text("contact us"),
                        subtitle: const Text("to Help -Recommended solutions"),
                        trailing: const Icon(
                          Icons.phone_enabled_outlined,
                          color: appColors.primaryColor,
                          size: 30,
                        )),
                  ),
                  const Divider(
                    height: 10,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onTap: () async {
                          await Utails.awesomeDialog(
                            context,
                            "Ecommerce app \nVerison: 1",
                            "app deleveloper: maged mowafy \n Email: magedmowafy4@gmail.com",
                          );
                        },
                        title: const Text("about us"),
                        subtitle: const Text("read more"),
                        trailing: const Icon(
                          Icons.info_outline,
                          color: appColors.primaryColor,
                          size: 30,
                        )),
                  ),
                  const Divider(
                    height: 10,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onTap: () {
                          controller.logout();
                        },
                        title: const Text("Logout"),
                        trailing: const Icon(
                          Icons.logout,
                          color: appColors.primaryColor,
                          size: 30,
                        )),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
