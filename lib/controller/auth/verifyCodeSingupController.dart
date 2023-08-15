import 'package:e_commerce_app/core/classes/StatusRequest.dart';
import 'package:e_commerce_app/core/constant/appRoutes.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/data/datasource/remote/auth/verifyCodeSingup.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSingupController extends GetxController {
  verifySingUpCode();
  goToTosuccessSingup(String verificationCode);
  reSendVerifyCode();
}

class VerifyCodeSingupControllerImp extends VerifyCodeSingupController {
  VerifyCodeSingupData verifyCodeSingupData = VerifyCodeSingupData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  String? email;
  // late String verifyCode;

  @override
  goToTosuccessSingup(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await verifyCodeSingupData.postVCodesingupData(
        email!, verificationCode);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.offAllNamed(appRoutes.sucsessSingUpRoute);
      } else {
        Get.defaultDialog(
            title: "Error",
            contentPadding: const EdgeInsets.all(25),
            middleText: "Verify code Error please try again");
      }
    }

    update();
  }

  @override
  verifySingUpCode() {
    throw UnimplementedError();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  reSendVerifyCode() {
    verifyCodeSingupData.reSendVerifyCodedata(email!);
    Get.snackbar("verify code resned to", email!,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10));
  }

  //..... controller lifecycle
}
