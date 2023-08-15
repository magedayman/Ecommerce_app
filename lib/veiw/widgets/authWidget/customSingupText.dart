import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:flutter/material.dart';

class CustomSingupText extends StatelessWidget {
  const CustomSingupText(
      {super.key,
      required this.texttitle,
      required this.textIntent,
      required this.ontap});

  final String texttitle;
  final String textIntent;

  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        texttitle,
      ),
      InkWell(
        onTap: ontap,
        child: Text(
          textIntent,
          style: const TextStyle(
              color: appColors.accentblue, fontWeight: FontWeight.w700),
        ),
      )
    ]);
  }
}
