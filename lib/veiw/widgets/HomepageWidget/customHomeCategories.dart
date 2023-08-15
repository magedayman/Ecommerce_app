import 'package:e_commerce_app/controller/HomeController/HomepageController.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/constant/appLinkApi.dart';
import 'package:e_commerce_app/core/functions/translateDataBase.dart';
import 'package:e_commerce_app/data/model/CategoriesModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomHomeCategories extends GetView<HomepageControllerImp> {
  const CustomHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 110,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          separatorBuilder: (context, index) => const SizedBox(width: 20),
          itemBuilder: (context, index) {
            return Categories(
                index: index,
                categoriesModle:
                    CategoriesModel.fromJson(controller.categories[index]));
          },
        ));
  }
}

class Categories extends GetView<HomepageControllerImp> {
  final CategoriesModel categoriesModle;
  final int? index;
  const Categories(
      {required this.categoriesModle, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        controller.goToItemCategories(
            controller.categories, index!, categoriesModle.categoriesId!);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: 100,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(colors: [
                  appColors.primaryColor.withOpacity(0.6),
                  appColors.accentblue.withOpacity(0.2),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  width: 60,
                  height: 60,
                  child: SvgPicture.network(
                      "${AppLinkApi.apiCatergoriesImage}/${categoriesModle.categoriesImage}"),
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                      "${translateDatabase(categoriesModle.categoriesNameAr, categoriesModle.categoriesName)}",
                      style: const TextStyle(
                          color: appColors.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
