import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:flutter/material.dart';

class CustomTitleHome extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Color? color;

  const CustomTitleHome(
      {super.key, required this.title, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Row(
        children: [
          Text(title,
              style: const TextStyle(
                  color: appColors.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600)),
          const SizedBox(
            width: 5,
          ),
          Icon(
            icon,
            color: color,
            size: 25,
          ),
        ],
      ),
    );
  }
}
