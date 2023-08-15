// ignore: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/HomeController/HomepageController.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/constant/appLinkApi.dart';
import 'package:e_commerce_app/core/functions/translateDataBase.dart';
import 'package:e_commerce_app/data/model/ItemsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomItemsHome extends GetView<HomepageControllerImp> {
  const CustomItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: ((context, index) {
            return ItemsList(
              ItemsModel.fromJson(controller.items[index]),
            );
          })),
    );
  }
}

class ItemsList extends GetView<HomepageControllerImp> {
  final ItemsModel itemsModel;

  const ItemsList(this.itemsModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        controller.goToItemsDetails(itemsModel);
      },
      child: Stack(
        children: [
          Positioned(
              bottom: 5,
              top: 5,
              left: 0,
              right: 0,
              child: Container(
                height: 130,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        colors: [
                          appColors.accentblue.withOpacity(0.7),
                          appColors.accentblue.withOpacity(0.5),
                          appColors.primaryColor.withOpacity(0.7),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
              )),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: CachedNetworkImage(
              fit: BoxFit.scaleDown,
              imageUrl: "${AppLinkApi.apiItemsImage}/${itemsModel.itemsImage}",
              height: 150,
              width: 150,
            ),
          ),
          Positioned(
              top: 15,
              left: 20,
              right: 5,
              child: Text(
                "${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                style: const TextStyle(
                    color: appColors.primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              )),
          Positioned(
              left: 15,
              bottom: 15,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Text("Discount : ${itemsModel.itemsDiscount} %",
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: appColors.primaryColor)),
              )),
        ],
      ),
    );
  }
}
