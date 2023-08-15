import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ShippingMethods extends StatelessWidget {
  const ShippingMethods(
      {super.key,
      required this.shippingImage,
      required this.shippingTitle,
      required this.onPressd,
      required this.selected});

  final String shippingImage;
  final String shippingTitle;
  final void Function()? onPressd;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onPressd,
      child: Column(
        children: [
          Container(
            height: 90,
            decoration: BoxDecoration(
                color: selected == true
                    ? appColors.primaryColor
                    : appColors.primaryColor.withOpacity(0.1),
                border: Border.all(color: appColors.primaryColor),
                borderRadius: BorderRadius.circular(20)),
            child: Lottie.asset(
              height: 90,
              alignment: Alignment.center,
              shippingImage,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              textAlign: TextAlign.start,
              shippingTitle,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
