import 'package:e_commerce_app/core/classes/StatusRequest.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/constant/appRoutes.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/data/datasource/remote/auth/Singup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SingUpController extends GetxController {
  singup();

  gotoLogin();

  isShowPassword();
}

class SingUpControllerImp extends SingUpController {
  late TextEditingController email, password, phone, username;

  late GlobalKey<FormState> singupFormState = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;

  SingupData singupdata = SingupData(Get.find());

  bool obscurePassword = true;

  @override
  isShowPassword() {
    //  obscurePassword == true ? false : true;
    obscurePassword = !obscurePassword;
    update();
  }

  @override
  gotoLogin() {
    Get.offAllNamed(appRoutes.loginRoute);
  }

  @override
  singup() async {
    if (singupFormState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;

      update();

      var response = await singupdata.postSingupData(
          username.text, email.text, phone.text, password.text);

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.offAllNamed(appRoutes.verifyEmailsingUpRoute, arguments: {
            "email": email.text,
          });
        } else {
          Get.defaultDialog(
              title: "Warning",
              contentPadding: const EdgeInsets.all(15),
              content: const Text(
                "Email or password alredy exist",
                style: TextStyle(color: appColors.primaryColor),
              ));

          // Get.snackbar("error ", "password and email alreday exist",
          //     margin: EdgeInsets.all(20), snackPosition: SnackPosition.BOTTOM);
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();
    super.dispose();
  }
}
