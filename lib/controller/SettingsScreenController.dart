import 'package:e_commerce_app/core/constant/appRoutes.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:get/get.dart';

abstract class SettingsScreenController extends GetxController {
  logout();
}

class SettingsScreenControllerImp extends SettingsScreenController {
  appServices service = Get.find();
  @override
  logout() {
    service.sharedpreferance.clear();
    Get.offAllNamed(appRoutes.loginRoute);
  }
}
