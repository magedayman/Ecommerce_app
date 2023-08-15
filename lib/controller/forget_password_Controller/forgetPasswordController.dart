import 'package:e_commerce_app/core/classes/StatusRequest.dart';
import 'package:e_commerce_app/core/constant/appRoutes.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/data/datasource/remote/forgetpassword/check_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkForgetPasswordEmail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;
  late GlobalKey<FormState> formState = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;

  CheckEmailData checkemaildata = CheckEmailData(Get.find());

  @override
  checkForgetPasswordEmail() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await checkemaildata.postCheckEmailData(email.text);

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          Get.toNamed(appRoutes.verifyPasswordRoute, arguments: {
            "email": email.text,
          });
        } else {
          Get.defaultDialog(
              title: "warning !",
              middleText: "You Have Entered not Matched Email.",
              contentPadding: const EdgeInsets.all(15));
        }
      }
    }

    update();
  }

  //..... controller lifecycle

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}
