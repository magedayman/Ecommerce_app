// ignore_for_file: camel_case_types, must_call_super

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class appServices extends GetxService {
  late SharedPreferences sharedpreferance;

  @override
  Future<appServices> onInit() async {
    sharedpreferance = await SharedPreferences.getInstance();

    return this;
  }
}

intialappServices() async {
  await Get.putAsync(() => appServices().onInit());
}
