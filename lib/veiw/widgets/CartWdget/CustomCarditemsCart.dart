import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/constant/appLinkApi.dart';
import 'package:flutter/material.dart';

class CustomCarditemsCart extends StatelessWidget {
  const CustomCarditemsCart(
      {super.key,
      required this.titleproduct,
      required this.productprice,
      required this.countty,
      required this.itemImage,
      required this.onaddCart,
      required this.onRemoveCart});

  final String titleproduct, productprice, countty, itemImage;

  final void Function()? onaddCart;
  final void Function()? onRemoveCart;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(children: [
        Expanded(
            flex: 2,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                    gradient: LinearGradient(
                        colors: [
                          appColors.primaryColor.withOpacity(0.7),
                          appColors.primaryColor.withOpacity(0.3),
                          appColors.primaryColor.withOpacity(0.0001)
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight)),
                child: CachedNetworkImage(
                  height: 150,
                  width: 150,
                  imageUrl: "${AppLinkApi.apiItemsImage}/$itemImage",
                  fit: BoxFit.scaleDown,
                ))),
        Expanded(
          flex: 2,
          child: ListTile(
            title: Text(
              titleproduct,
              style: const TextStyle(
                  fontSize: 16,
                  color: appColors.primaryColor,
                  fontWeight: FontWeight.w500),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Price: $productprice \$",
                style: const TextStyle(
                    color: appColors.red, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                IconButton(
                    onPressed: onaddCart,
                    icon: const Icon(Icons.add_circle_outline,
                        color: appColors.primaryColor)),
                Text(
                  countty,
                  style: const TextStyle(color: appColors.primaryColor),
                ),
                IconButton(
                    onPressed: onRemoveCart,
                    icon: const Icon(
                      Icons.remove_circle_outline,
                      color: appColors.red,
                    ))
              ],
            ))
      ]),
    );
  }
}
