// ignore_for_file: camel_case_types

import 'package:e_commerce_app/controller/auth/SingupController.dart';
import 'package:e_commerce_app/core/classes/Handling_data_View.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/functions/ValidatInputField.dart';
import 'package:e_commerce_app/core/functions/appAlertExit.dart';
import 'package:e_commerce_app/veiw/widgets/authWidget/customBodyAuth.dart';
import 'package:e_commerce_app/veiw/widgets/authWidget/customSingupText.dart';
import 'package:e_commerce_app/veiw/widgets/authWidget/customTitleAuth.dart';
import 'package:e_commerce_app/veiw/widgets/authWidget/customButtonAuth.dart';
import 'package:e_commerce_app/veiw/widgets/authWidget/customTextFieldAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingUp extends StatelessWidget {
  const SingUp({super.key});

  @override
  Widget build(BuildContext context) {
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
              "21".tr,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontFamily: "Trajan Pro",
                  color: appColors.blueGrey,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
        body: WillPopScope(
          onWillPop: () {
            return Utails.alertExitapp(
                "warning", "are you sure you want exite app");
          },
          child: GetBuilder<SingUpControllerImp>(
              builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView(children: [
                      const SizedBox(height: 35),
                      const CustomAuthTitle(texttitle: "E-Commerce"),
                      const SizedBox(height: 20),
                      CustomBodyAuth(textBody: "22".tr),
                      Form(
                          key: controller.singupFormState,
                          child: Column(
                            children: [
                              customTextFieldAuth(
                                validator: (value) {
                                  return validatInputField(
                                      value!, 3, 20, "Username");
                                },
                                keyboardType: TextInputType.name,
                                hinttxet: "23".tr,
                                labelText: "24".tr,
                                suffixIcon:
                                    const Icon(Icons.person_outline_outlined),
                                controller: controller.username,
                              ),
                              customTextFieldAuth(
                                validator: (value) {
                                  return validatInputField(
                                      value!, 3, 20, "Phone");
                                },
                                keyboardType: TextInputType.phone,
                                hinttxet: "25".tr,
                                labelText: "26".tr,
                                suffixIcon:
                                    const Icon(Icons.phone_android_rounded),
                                controller: controller.phone,
                              ),
                              customTextFieldAuth(
                                validator: (value) {
                                  return validatInputField(
                                      value!, 3, 30, "Email");
                                },
                                keyboardType: TextInputType.emailAddress,
                                hinttxet: "27".tr,
                                labelText: "28".tr,
                                suffixIcon: const Icon(Icons.email_outlined),
                                controller: controller.email,
                              ),

                              // password show and hide
                              GetBuilder<SingUpControllerImp>(
                                builder: (controller) => customTextFieldAuth(
                                  validator: (value) {
                                    return validatInputField(value!, 5, 20, "");
                                  },
                                  ontap: () {
                                    controller.isShowPassword();
                                  },
                                  controller: controller.password,
                                  obscureText: controller.obscurePassword,
                                  keyboardType: TextInputType.visiblePassword,
                                  hinttxet: "29".tr,
                                  labelText: "30".tr,
                                  suffixIcon:
                                      const Icon(Icons.visibility_off_outlined),
                                  visibelitySuffixIcon:
                                      const Icon(Icons.visibility_outlined),
                                ),
                              )

                              //...........
                            ],
                          )),
                      CustomButtonAuth(
                        buttontext: "21".tr,
                        onPressed: () {
                          controller.singup();
                        },
                      ),
                      CustomSingupText(
                        texttitle: "31".tr,
                        textIntent: "19".tr,
                        ontap: () {
                          controller.gotoLogin();
                        },
                      ),
                    ]),
                  )
              //return the list view with all widget

              ),
        ));
  }
}
