import 'package:e_commerce_app/controller/HomeController/HomepageController.dart';
import 'package:e_commerce_app/controller/auth/SingupController.dart';
import 'package:e_commerce_app/controller/test_controller.dart';
import 'package:e_commerce_app/core/classes/Curd.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // sing up screen prevent save value on fields while intent other pages
    Get.lazyPut(() => SingUpControllerImp(), fenix: true);

    Get.put(Crud());
    Get.put(TestControllerImp());
    Get.lazyPut(() => HomepageControllerImp(), fenix: true);
  }
}
