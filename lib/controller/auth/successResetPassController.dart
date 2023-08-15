import 'package:e_commerce_app/core/constant/appRoutes.dart';
import 'package:get/get.dart';

abstract class SuccessResetPassController extends GetxController {
  onSuccessSingup();
  goToToSingIn();
}

class SuccessResetPassControllerImp extends SuccessResetPassController {
  @override
  goToToSingIn() {
    Get.offAllNamed(appRoutes.loginRoute);
  }

  @override
  onSuccessSingup() {}

  //..... controller lifecycle
}
