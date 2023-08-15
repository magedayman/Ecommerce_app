// ignore_for_file: camel_case_types

import 'package:e_commerce_app/controller/auth/LoginController.dart';
import 'package:e_commerce_app/core/classes/Handling_data_View.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/functions/appalertExit.dart';
import 'package:e_commerce_app/core/functions/validatInputField.dart';
import 'package:e_commerce_app/veiw/widgets/authWidget/authLogo.dart';
import 'package:e_commerce_app/veiw/widgets/authWidget/customBodyAuth.dart';
import 'package:e_commerce_app/veiw/widgets/authWidget/customSingupText.dart';
import 'package:e_commerce_app/veiw/widgets/authWidget/customTitleAuth.dart';
import 'package:e_commerce_app/veiw/widgets/authWidget/customButtonAuth.dart';
import 'package:e_commerce_app/veiw/widgets/authWidget/customTextFieldAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
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
              "19".tr,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontFamily: "Trajan Pro",
                  color: appColors.blueGrey,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
        body: GetBuilder<LoginControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: WillPopScope(
                    onWillPop: () {
                      return Utails.alertExitapp(
                          "Exite", "are you sure you want exite app");
                    },
                    child: ListView(children: [
                      const SizedBox(height: 20),
                      const AuthLogo(),
                      CustomAuthTitle(texttitle: "11".tr),
                      const SizedBox(height: 20),
                      CustomBodyAuth(textBody: "12".tr),
                      Form(
                          key: controller.singInformstate,
                          child: Column(
                            children: [
                              //.......email...................
                              customTextFieldAuth(
                                  validator: (value) {
                                    return validatInputField(
                                        value!, 10, 40, "Email");
                                  },
                                  controller: controller.email,
                                  keyboardType: TextInputType.emailAddress,
                                  hinttxet: "13".tr,
                                  labelText: "14".tr,
                                  suffixIcon: const Icon(Icons.email_outlined)),

                              //...password..................
                              customTextFieldAuth(
                                  validator: (value) {
                                    return validatInputField(
                                        value!, 5, 30, "Password");
                                  },
                                  ontap: () {
                                    controller.isShowPassword();
                                  },
                                  controller: controller.password,
                                  obscureText: controller.obscurePassword,
                                  keyboardType: TextInputType.visiblePassword,
                                  hinttxet: "15".tr,
                                  labelText: "16".tr,
                                  suffixIcon:
                                      const Icon(Icons.visibility_off_outlined),
                                  visibelitySuffixIcon:
                                      const Icon(Icons.visibility_outlined)),
                            ],
                          )),
                      InkWell(
                        onTap: () {
                          controller.goToForgetPassword();
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            textAlign: TextAlign.end,
                            "17".tr,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(fontSize: 14, color: appColors.grey),
                          ),
                        ),
                      ),
                      CustomButtonAuth(
                        buttontext: "18".tr,
                        onPressed: () {
                          controller.singIn();
                        },
                      ),
                      CustomSingupText(
                        texttitle: "20".tr,
                        textIntent: "21".tr,
                        ontap: () {
                          controller.goToSingup();
                        },
                      ),
                    ]),
                  ),
                )));
  }
}
