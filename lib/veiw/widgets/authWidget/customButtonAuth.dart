import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth(
      {super.key, required this.buttontext, required this.onPressed});

  final String buttontext;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
            colors: [
              appColors.LightBlue.withOpacity(0.7),
              appColors.accentblue.withOpacity(0.6),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
          )),
      child: MaterialButton(
        textColor: appColors.white,
        onPressed: onPressed,
        child: Text(
          buttontext,
          style: const TextStyle(
              fontWeight: FontWeight.w600, fontFamily: "Trajan Pro"),
        ),
      ),
    );
  }
}
