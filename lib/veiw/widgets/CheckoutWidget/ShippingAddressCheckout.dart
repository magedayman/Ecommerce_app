import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ShippingAddressCheckout extends StatelessWidget {
  const ShippingAddressCheckout(
      {super.key,
      required this.addressTitle,
      required this.addressSubTitle,
      required this.onPressd,
      required this.selected});

  final String addressTitle, addressSubTitle;
  final void Function()? onPressd;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onPressd,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 2,
        child: Container(
          decoration: BoxDecoration(
              color: selected == true
                  ? appColors.primaryColor
                  : appColors.primaryColor.withOpacity(0.4),
              borderRadius: BorderRadius.circular(20)),
          child: ListTile(
              title: Text(
                addressTitle,
                style: const TextStyle(
                    color: appColors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                addressSubTitle,
                style: const TextStyle(color: appColors.white),
              )),
        ),
      ),
    );
  }
}
