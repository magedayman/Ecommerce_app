import 'package:e_commerce_app/controller/HomeController/MainHomeScreenController.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/constant/appRoutes.dart';
import 'package:e_commerce_app/core/functions/appAlertExit.dart';
import 'package:e_commerce_app/veiw/widgets/MainHomeScreenWidget/customNavigatorbottomAppbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainHomeScreenControllerImp());
    return GetBuilder<MainHomeScreenControllerImp>(
        builder: (controller) => Scaffold(
            backgroundColor: appColors.white,
            resizeToAvoidBottomInset: false,
            floatingActionButton: FloatingActionButton(
              elevation: 0,
              backgroundColor: appColors.blueGrey,
              onPressed: () {
                Get.toNamed(appRoutes.cartscreen);
              },
              child: const Icon(Icons.shopping_cart_outlined),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: const BottomAppBar(
                shadowColor: appColors.black,
                color: appColors.white,
                shape: CircularNotchedRectangle(),
                notchMargin: 7,
                elevation: 30,
                padding: EdgeInsets.symmetric(vertical: 5),
                child: NavigatorbottomAppbar()),
            body: WillPopScope(
                child: controller.PagesList.elementAt(controller.currentpage),
                onWillPop: () {
                  Utails.alertExitapp(
                      "Confirm exit", "are you sure you want to quit ?");
                  return Future.value(false);
                })));
  }
}
