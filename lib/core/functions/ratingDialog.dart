import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/constant/imageAssets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../controller/OrdersController/ordersArchiveController.dart';

void onRatingDialog(BuildContext context, String model) {
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      submitButtonTextStyle: const TextStyle(
          color: appColors.primaryColor, fontWeight: FontWeight.bold),
      initialRating: 1.0,
      starSize: 35,
      // your app's name?
      title: const Text(
        'Rating deliverd orders',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: const Text(
        'Add more description here if you want.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image: Container(
          height: 150, width: 150, child: Image.asset(AppimageAssets.appLogo)),
      submitButtonText: 'Submit',

      commentHint: 'Tell us your comment ',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print('rating: ${response.rating}, comment: ${response.comment}');

        OrdersArchiveControllerImp controllerImp = Get.find();

        controllerImp.getRatingdata(
            model, response.rating.toString(), response.comment);
      },
    ),
  );
}
