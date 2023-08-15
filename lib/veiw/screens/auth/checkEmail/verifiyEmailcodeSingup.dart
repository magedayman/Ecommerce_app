// ignore_for_file: camel_case_types

import 'package:e_commerce_app/controller/auth/verifyCodesingupController.dart';
import 'package:e_commerce_app/core/classes/Handling_data_View.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/veiw/widgets/authWidget/customBodyAuth.dart';
import 'package:e_commerce_app/veiw/widgets/authWidget/customTitleAuth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCodeSingUp extends StatelessWidget {
  const VerifyCodeSingUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSingupControllerImp());
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
        body: GetBuilder<VerifyCodeSingupControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: ListView(children: [
                    const SizedBox(height: 35),
                    CustomAuthTitle(texttitle: "36".tr),
                    const SizedBox(height: 30),
                    CustomBodyAuth(textBody: "38".tr),
                    Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Center(
                            child: Text(
                          "${controller.email}",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 16),
                        ))),
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
                            controller.goToTosuccessSingup(verificationCode);
                          }, // end onSubmit
                        ),
                        const SizedBox(height: 30),

                        //.....

                        MaterialButton(
                          onPressed: () {
                            controller.reSendVerifyCode();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.replay_circle_filled_outlined),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Resend verifycode",
                                    style: TextStyle(
                                        color: appColors.primaryColor,
                                        fontSize: 17),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                  ]),
                )));
  }
}
