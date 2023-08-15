// ignore_for_file: camel_case_types

import 'package:e_commerce_app/controller/forget_password_Controller/ResetPasswordController.dart';
import 'package:e_commerce_app/core/classes/Handling_data_View.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/functions/validatInputField.dart';
import 'package:e_commerce_app/veiw/widgets/authWidget/customBodyAuth.dart';
import 'package:e_commerce_app/veiw/widgets/authWidget/customTitleAuth.dart';
import 'package:e_commerce_app/veiw/widgets/authWidget/customButtonAuth.dart';
import 'package:e_commerce_app/veiw/widgets/authWidget/customTextFieldAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
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
            "reset password",
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontFamily: "Trajan Pro",
                color: appColors.blueGrey,
                fontWeight: FontWeight.w300),
          ),
        ),
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
          builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                  const SizedBox(height: 35),
                  const CustomAuthTitle(texttitle: "new password"),
                  const SizedBox(height: 30),
                  CustomBodyAuth(textBody: "Please Entre new Password"),
                  Form(
                      key: controller.formState,
                      child: Column(
                        children: [
                          customTextFieldAuth(
                            validator: (value) {
                              return validatInputField(
                                  value!, 5, 20, "password");
                            },
                            obscureText: controller.obscurePassword,
                            ontap: () {
                              controller.onShowPassword();
                            },
                            suffixIcon: const Icon(Icons.visibility_off),
                            visibelitySuffixIcon: const Icon(Icons.visibility),
                            controller: controller.password,
                            keyboardType: TextInputType.visiblePassword,
                            hinttxet: "New Password",
                            labelText: " Password",
                          ),
                          customTextFieldAuth(
                            validator: (value) {
                              return validatInputField(
                                  value!, 5, 20, "password");
                            },
                            obscureText: controller.obscurePassword,
                            ontap: () {
                              controller.onShowPassword();
                            },
                            suffixIcon: const Icon(Icons.visibility_off),
                            visibelitySuffixIcon: const Icon(Icons.visibility),
                            keyboardType: TextInputType.visiblePassword,
                            hinttxet: "Confirm new Password",
                            labelText: "Retype Password",
                            controller: controller.confirmPassword,
                          ),
                        ],
                      )),
                  CustomButtonAuth(
                    buttontext: "submit",
                    onPressed: () {
                      controller.goToSucssesResetPassword();
                    },
                  ),
                ]),
              )),
    );
  }
}
