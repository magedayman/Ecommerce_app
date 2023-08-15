import 'package:e_commerce_app/core/classes/StatusRequest.dart';
import 'package:e_commerce_app/core/constant/appRoutes.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/data/datasource/remote/forgetpassword/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  goToSucssesResetPassword();

  onShowPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password, confirmPassword;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  ResetpasswordData resetpasswordData = ResetpasswordData(Get.find());

  String? email;

  bool obscurePassword = true;
  @override
  onShowPassword() {
    obscurePassword = !obscurePassword;
    update();
  }

  @override
  goToSucssesResetPassword() async {
    if (password.text != confirmPassword.text) {
      Get.defaultDialog(
          contentPadding: const EdgeInsets.all(20),
          title: "Warnning",
          middleText: "password dons't match\nTry another one");
    } else if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await resetpasswordData.postResetpasswordData(email!, password.text);

      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          Get.offAllNamed(appRoutes.sucsessResetPassRoute);
        } else {
          Get.defaultDialog(
              contentPadding: const EdgeInsets.all(20),
              title: "Warnning",
              middleText: "password dosn't match\nplease try again.");
        }
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    password = TextEditingController();
    confirmPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    confirmPassword.dispose();

    super.dispose();
  }
}
