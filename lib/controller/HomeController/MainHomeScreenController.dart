import 'package:e_commerce_app/veiw/screens/Homepage.dart';
import 'package:e_commerce_app/veiw/screens/Offers/Offers.dart';
import 'package:e_commerce_app/veiw/screens/SettingsScreen.dart';
import 'package:e_commerce_app/veiw/screens/orders/PendingOrders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MainHomeScreenController extends GetxController {
  changePage(int index);
}

class MainHomeScreenControllerImp extends MainHomeScreenController {
  int currentpage = 0;

  List<Widget> PagesList = [
    const Homepage(),
    const Offers(),
    const PendingOrders(),
    const SettingsScreen(),
  ];

  List<String> bottomBarTitl = ["Home", "Offers", "Orders", "settings"];

  List<IconData> outlineAppBarIcon = [
    Icons.home_outlined,
    Icons.discount_outlined,
    Icons.delivery_dining_outlined,
    Icons.settings_suggest_outlined,
  ];
  List<IconData> appBarIcon = [
    Icons.home_work_rounded,
    Icons.discount,
    Icons.delivery_dining,
    Icons.settings_suggest_rounded,
  ];
  @override
  changePage(int index) {
    currentpage = index;
    update();
  }
}
