// ignore_for_file: camel_case_types

import 'package:e_commerce_app/controller/forget_password_Controller/verifypassCodeController.dart';
import 'package:e_commerce_app/core/classes/Handling_data_View.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/veiw/widgets/authWidget/customBodyAuth.dart';
import 'package:e_commerce_app/veiw/widgets/authWidget/customTitleAuth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class verifyPasswordCode extends StatelessWidget {
  const verifyPasswordCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyPasswordControllerImp());
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
              "37".tr,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontFamily: "Trajan Pro",
                  color: appColors.blueGrey,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
        body: GetBuilder<VerifyPasswordControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: ListView(children: [
                    const SizedBox(height: 35),
                    CustomAuthTitle(texttitle: "36".tr),
                    const SizedBox(height: 30),
                    CustomBodyAuth(textBody: "38".tr),
                    Form(
                        child: Column(
                      children: [
                        OtpTextField(
                          numberOfFields: 5,
                          borderRadius: BorderRadius.circular(30),
                          focusedBorderColor: appColors.accentblue,
                          showFieldAsBox: true,
                          fieldWidth: 50.0,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {},
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {
                            controller.goToResetPassword(verificationCode);
                          }, // end onSubmit
                        ),
                      ],
                    )),
                  ]),
                )));
  }
}
