import 'dart:ui';

import 'package:e_commerce_app/controller/HomeController/itemsDeatilsController.dart';
import 'package:e_commerce_app/core/classes/Handling_data_View.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/constant/appRoutes.dart';
import 'package:e_commerce_app/veiw/widgets/ItemsDetailsWidgets/ColorsItemsdetails.dart';
import 'package:e_commerce_app/veiw/widgets/ItemsDetailsWidgets/CountandPriceItemsDeatils.dart';
import 'package:e_commerce_app/veiw/widgets/ItemsDetailsWidgets/HeaderItemsDetailsImg.dart';
import 'package:e_commerce_app/veiw/widgets/ItemsDetailsWidgets/TitleItemsDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsDetailsScreen extends GetView<ItemsDetailsControllerImp> {
  const ItemsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsDetailsControllerImp());
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: appColors.primaryColor,
            onPressed: () {
              Get.toNamed(appRoutes.cartscreen);
            },
            label: const Text("Cart ",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
            icon: const Icon(Icons.shopping_bag_outlined),
            isExtended: true),
        body: ListView(children: [
          const HeadrItemsDeatilsImg(),
          const SizedBox(height: 70),

          //.....

          GetBuilder<ItemsDetailsControllerImp>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${controller.itemsModel.itemsName}",
                          style: Theme.of(context).textTheme.displayMedium),
                      const Divider(height: 15),
                      CountandPriceItemsDetails(
                          cartIncrement: () {
                            controller.onaddCart();
                          },
                          cartDecrement: () {
                            controller.onDeleteCart();
                          },
                          count: "${controller.cartItemsCount}",
                          price: "${controller.itemsModel.itemspriceDiscount}"),
                      const Divider(height: 5),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TitleItemsDetails(title: "Details"),
                                ColorsItemDetails()
                              ],
                            ),
                            const Divider(height: 25),
                            Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Text("${controller.itemsModel.itemsDesc}",
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w800,
                                      color: appColors.grey)),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          )
        ]));
  }
}
