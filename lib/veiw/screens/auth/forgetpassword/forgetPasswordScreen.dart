// ignore_for_file: camel_case_types

import 'package:e_commerce_app/controller/forget_password_Controller/forgetPasswordController.dart';
import 'package:e_commerce_app/core/classes/Handling_data_View.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/functions/ValidatInputField.dart';
import 'package:e_commerce_app/veiw/widgets/authWidget/customBodyAuth.dart';
import 'package:e_commerce_app/veiw/widgets/authWidget/customTitleAuth.dart';
import 'package:e_commerce_app/veiw/widgets/authWidget/customButtonAuth.dart';
import 'package:e_commerce_app/veiw/widgets/authWidget/customTextFieldAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class forgetPassword extends StatelessWidget {
  const forgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());

    return Scaffold(
      backgroundColor: appColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: appColors.blue,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            "32".tr,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontFamily: "Trajan Pro",
                color: appColors.blueGrey,
                fontWeight: FontWeight.w300),
          ),
        ),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
          builder: (controller) => HandlingDataRequest(
              widget: ListView(children: [
                const SizedBox(height: 35),
                CustomAuthTitle(texttitle: "33".tr),
                const SizedBox(height: 30),
                CustomBodyAuth(textBody: "34".tr),
                Form(
                    key: controller.formState,
                    child: Column(
                      children: [
                        customTextFieldAuth(
                          validator: (value) {
                            return validatInputField(value!, 5, 30, "email");
                          },
                          keyboardType: TextInputType.emailAddress,
                          hinttxet: "27".tr,
                          labelText: "28".tr,
                          suffixIcon: const Icon(Icons.email_outlined),
                          controller: controller.email,
                        ),
                      ],
                    )),
                CustomButtonAuth(
                  buttontext: "35".tr,
                  onPressed: () {
                    controller.checkForgetPasswordEmail();
                  },
                ),
              ]),
              statusRequest: controller.statusRequest)),
    );
  }
}
