import 'package:e_commerce_app/controller/HomeController/itemsDeatilsController.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountandPriceItemsDetails extends GetView<ItemsDetailsControllerImp> {
  const CountandPriceItemsDetails(
      {super.key,
      required this.cartIncrement,
      required this.cartDecrement,
      required this.count,
      required this.price});
  final Function()? cartIncrement;
  final Function()? cartDecrement;
  final String count, price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: cartIncrement,
                    icon: const Icon(
                      Icons.add_circle_outline_rounded,
                      size: 30,
                    )),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    count,
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: appColors.red),
                  ),
                ),
                IconButton(
                    onPressed: cartDecrement,
                    icon: const Icon(
                      Icons.remove_circle_outline_rounded,
                      size: 30,
                    )),
              ],
            ),
            const Spacer(),
            Text("$price \$",
                style: const TextStyle(
                    fontSize: 17,
                    color: appColors.primaryColor,
                    fontWeight: FontWeight.w800))
          ],
        ),
      ],
    );
  }
}
