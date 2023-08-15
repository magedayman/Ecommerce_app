import 'package:e_commerce_app/core/constant/appRoutes.dart';
import 'package:get/get.dart';

abstract class SuccessSingupController extends GetxController {
  onSuccessSingup();
  goToToSingIn();
}

class SuccessSingupControllerImp extends SuccessSingupController {
  @override
  goToToSingIn() {
    Get.offAllNamed(appRoutes.loginRoute);
  }

  @override
  onSuccessSingup() {}

  //..... controller lifecycle
}
