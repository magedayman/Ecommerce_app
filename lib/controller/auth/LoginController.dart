import 'package:e_commerce_app/core/classes/StatusRequest.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/constant/appRoutes.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/datasource/remote/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  singIn();
  goToSingup();
  goToForgetPassword();
  isShowPassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  late GlobalKey<FormState> singInformstate = GlobalKey<FormState>();
  bool obscurePassword = true;
  StatusRequest statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());

  appServices services = Get.find();

  @override
  singIn() async {
    if (singInformstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await loginData.postLoginData(email.text, password.text);
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          if (response["data"]["users_approve"] == "1") {
            services.sharedpreferance
                .setString("id", response["data"]["users_id"]);
            services.sharedpreferance
                .setString("username", response["data"]["users_name"]);
            services.sharedpreferance
                .setString("email", response["data"]["users_email"]);
            services.sharedpreferance
                .setString("phone", response["data"]["users_phone"]);
            services.sharedpreferance.setString("step", "2");

            Get.offNamed(appRoutes.onHomepageRoute);
          } else {
            Get.offNamed(appRoutes.verifyEmailsingUpRoute, arguments: {
              "email": email.text,
            });
          }
        } else {
          Get.defaultDialog(
            middleTextStyle: const TextStyle(color: appColors.accentblue),
            title: "Error",
            middleText:
                " email and password that you've enterd dosn't match any account\nplease sing up ",
          );
        }
      } else {
        statusRequest = StatusRequest.serverFaluier;
      }

      update();
    }
  }

  @override
  isShowPassword() {
    //  obscurePassword == true ? false : true;
    obscurePassword = !obscurePassword;
    update();
  }

  @override
  goToSingup() {
    Get.offAllNamed(appRoutes
        .singupRoute); // Tip 1-  to prevent duplucated page at sing in page
  }

  @override
  goToForgetPassword() {
    Get.toNamed(appRoutes.forgetPasswordRoute);
  }

  //..... controller lifecycle

  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value) {
    //   print(value);
    //   String? token = value;
    // });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
