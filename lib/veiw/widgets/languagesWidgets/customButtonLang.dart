// ignore_for_file: camel_case_types, file_names

import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:flutter/material.dart';

class customButtonLang extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final Color? value;

  const customButtonLang(
      {super.key, required this.title, required this.onPressed, this.value});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
          elevation: MaterialStatePropertyAll(8),
          textStyle: MaterialStatePropertyAll(
              TextStyle(color: appColors.white, fontWeight: FontWeight.w500)),
          padding: MaterialStatePropertyAll(
              EdgeInsetsDirectional.symmetric(horizontal: 100)),
          backgroundColor: MaterialStatePropertyAll(appColors.blue)),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
