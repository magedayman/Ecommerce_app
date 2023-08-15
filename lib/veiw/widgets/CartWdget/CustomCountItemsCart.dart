import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:flutter/material.dart';

class CustomCountItemsCart extends StatelessWidget {
  const CustomCountItemsCart({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: appColors.primaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20)),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.shopping_bag_outlined,
                color: appColors.primaryColor,
              ),
              Text(
                textAlign: TextAlign.center,
                title,
                style: const TextStyle(
                    color: appColors.primaryColor, fontWeight: FontWeight.w600),
              ),
            ],
          )),
    );
  }
}
