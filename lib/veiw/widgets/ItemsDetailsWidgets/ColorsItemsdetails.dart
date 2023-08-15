import 'package:e_commerce_app/controller/HomeController/itemsDeatilsController.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorsItemDetails extends GetView<ItemsDetailsControllerImp> {
  const ColorsItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.itemsProductColors.length,
          (index) => InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: () {},
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                alignment: Alignment.center,
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: controller.itemsProductColors[index]["active"] == "1"
                      ? appColors.black
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: appColors.primaryColor),
                ),
                child: Text(
                  controller.itemsProductColors[index]["color"],
                  style: TextStyle(
                      color:
                          controller.itemsProductColors[index]["active"] == "1"
                              ? appColors.white
                              : appColors.black,
                      fontSize: 12),
                )),
          ),
        )
      ],
    );
  }
}
