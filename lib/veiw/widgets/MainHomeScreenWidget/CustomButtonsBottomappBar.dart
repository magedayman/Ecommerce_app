import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:flutter/material.dart';

class CustomButtonsBottomappBar extends StatelessWidget {
  const CustomButtonsBottomappBar({
    super.key,
    required this.onPressed,
    required this.iconData,
    required this.tilte,
    required this.active,
    required this.staticIcon,
  });
  final void Function()? onPressed;
  final IconData iconData;
  final IconData staticIcon;
  final String tilte;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            active == true ? staticIcon : iconData,
            size: 30,
            color: active == true ? appColors.primaryColor : appColors.blueGrey,
          ),
          Text(tilte,
              style: TextStyle(
                  color: active == true
                      ? appColors.primaryColor
                      : appColors.blueGrey,
                  fontSize: 11,
                  fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }
}


// Theme.of(context).textTheme.displayLarge!.copyWith(
//                   fontSize: 10,
//                   color: active == true
//                       ? appColors.primaryColor
//                       : appColors.grey.withOpacity(0.4))