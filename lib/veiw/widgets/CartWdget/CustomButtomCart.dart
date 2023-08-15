import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:flutter/material.dart';

class CustomButtomCart extends StatelessWidget {
  const CustomButtomCart(
      {super.key, required this.buttontext, required this.onPressed});

  final String buttontext;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 250,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 15, top: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
            colors: [
              appColors.primaryColor.withOpacity(0.9),
              appColors.primaryColor.withOpacity(0.8),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
      child: MaterialButton(
        textColor: appColors.white,
        onPressed: onPressed,
        child: Text(
          buttontext,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
