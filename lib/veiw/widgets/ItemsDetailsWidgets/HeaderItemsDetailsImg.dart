import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/HomeController/itemsDeatilsController.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/constant/appLinkApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeadrItemsDeatilsImg extends GetView<ItemsDetailsControllerImp> {
  const HeadrItemsDeatilsImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
        height: Get.height * 0.25,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                appColors.primaryColor.withOpacity(0.4),
                appColors.primaryColor.withOpacity(0.3),
                appColors.primaryColor.withOpacity(0.0009),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            ),
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(0),
            )),
      ),
      Positioned(
          right: Get.width * 0.1,
          left: Get.width * 0.1,
          bottom: Get.width * -0.2,
          child: Hero(
            tag: "${controller.itemsModel.itemsId}",
            child: Container(
              child: CachedNetworkImage(
                  height: 300,
                  width: 300,
                  imageUrl:
                      "${AppLinkApi.apiItemsImage}/${controller.itemsModel.itemsImage}"),
            ),
          ))
    ]);
  }
}
