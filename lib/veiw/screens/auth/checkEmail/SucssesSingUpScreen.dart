import 'package:e_commerce_app/controller/auth/successSingupController.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/veiw/widgets/authWidget/customBodyAuth.dart';
import 'package:e_commerce_app/veiw/widgets/authWidget/customButtonAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SucssesSingUp extends StatelessWidget {
  const SucssesSingUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSingupControllerImp singupControllerImp =
        Get.put(SuccessSingupControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: appColors.blue,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            "Success ",
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontFamily: "Trajan Pro",
                color: appColors.blueGrey,
                fontWeight: FontWeight.w300),
          ),
        ),
      ),
      body: ListView(
        children: [
          const Center(
            child: SizedBox(
              height: 400,
              child: Icon(
                Icons.check_circle_outline,
                size: 300,
                color: appColors.blue,
              ),
            ),
          ),
          const Center(
            child: Text(
              "Congrats..!",
              style: TextStyle(
                  color: appColors.accentblue,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  letterSpacing: 4),
            ),
          ),
          const SizedBox(height: 30),
          CustomBodyAuth(
              textBody: "You are now complete Singup Succsseful Singin now "),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
              width: double.infinity,
              child: CustomButtonAuth(
                  buttontext: "singin ",
                  onPressed: () {
                    singupControllerImp.goToToSingIn();
                  })),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
