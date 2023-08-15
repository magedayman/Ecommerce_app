import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:flutter/material.dart';

class PayemntMethodsCheckout extends StatelessWidget {
  const PayemntMethodsCheckout(
      {super.key,
      required this.paymentTitle,
      required this.onPressed,
      required this.icon,
      required this.selected});

  final String paymentTitle;
  final void Function()? onPressed;
  final IconData? icon;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: selected == true
                ? appColors.primaryColor
                : appColors.primaryColor.withOpacity(0.4)),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Icon(
                  icon,
                  color: appColors.white,
                )),
            Expanded(
              flex: 2,
              child: Text(
                paymentTitle,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: appColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
