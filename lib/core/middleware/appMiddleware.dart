// ignore_for_file: overridden_fields

import 'package:e_commerce_app/core/constant/appRoutes.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppMiddleware extends GetMiddleware {
  final appServices _services = Get.find();

  @override
  int? priority = 1;

  @override
  RouteSettings? redirect(String? route) {
    if (_services.sharedpreferance.getString("step") == "2") {
      return const RouteSettings(name: appRoutes.onHomepageRoute);
    }
    if (_services.sharedpreferance.getString("step") == "1") {
      return const RouteSettings(name: appRoutes.loginRoute);
    }

    return null;
  }
}
