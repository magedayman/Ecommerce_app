import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:flutter/material.dart';

class TitleItemsDetails extends StatelessWidget {
  const TitleItemsDetails({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: appColors.grey)),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          title,
          style: const TextStyle(
              color: appColors.primaryColor,
              fontSize: 17,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
