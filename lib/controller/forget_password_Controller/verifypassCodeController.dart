import 'package:e_commerce_app/core/classes/StatusRequest.dart';
import 'package:e_commerce_app/core/constant/appRoutes.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/data/datasource/remote/forgetpassword/verifyCode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifyPasswordController extends GetxController {
  goToResetPassword(String verifyCode);
}

class VerifyPasswordControllerImp extends VerifyPasswordController {
  String? email;

  StatusRequest statusRequest = StatusRequest.none;

  VerifyCodepPwData verifyCodepPwData = VerifyCodepPwData(Get.find());

  @override
  goToResetPassword(String verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();

    var response =
        await verifyCodepPwData.postverifycodeFPdata(email!, verifyCode);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.offAllNamed(appRoutes.resetPasswordRoute, arguments: {
          "email": email,
        });
      } else {
        Get.defaultDialog(
            title: "Warning ! ",
            middleText: "Try again verifiction code Error.",
            contentPadding: const EdgeInsets.all(25));
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
