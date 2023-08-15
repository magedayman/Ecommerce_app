import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Utails {
  static Future<bool> alertExitapp(String title, String content) {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(20),
        title: title,
        content: Text(content),
        actions: [
          MaterialButton(
              color: appColors.red,
              textColor: appColors.white,
              onPressed: () {
                Get.back();
              },
              child: const Text("Cancel")),
          MaterialButton(
              color: appColors.primaryColor,
              textColor: appColors.white,
              onPressed: () {
                exit(0);
              },
              child: const Text("Confirm")),
        ]);

    return Future.value(true);
  }

  static Future<bool> awesomeDialog(
      BuildContext context, String title, String content) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.bottomSlide,
      title: title,
      padding: const EdgeInsets.all(20),
      desc: content,
    ).show();

    return Future.value(true);
  }
}
