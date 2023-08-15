import 'package:e_commerce_app/controller/HomeController/itemsPageCategoriesController.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/functions/TranslateDataBase.dart';
import 'package:e_commerce_app/data/model/CategoriesModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsListCategories extends GetView<ItemsPageCategoriesControllerImp> {
  const ItemsListCategories({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsPageCategoriesControllerImp());
    return SizedBox(
        height: 40,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          separatorBuilder: (context, index) => const SizedBox(width: 30),
          itemBuilder: (context, index) {
            return Categories(
                index: index,
                categoriesModle:
                    CategoriesModel.fromJson(controller.categories[index]));
          },
        ));
  }
}

class Categories extends StatelessWidget {
  final CategoriesModel categoriesModle;
  final int? index;
  const Categories(
      {required this.categoriesModle, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsPageCategoriesControllerImp>(
      builder: (controller) => InkWell(
        onTap: () {
          controller.changeInnerItems(index!, categoriesModle.categoriesId!);
        },
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(0),
              decoration: controller.selectedCategoriy == index
                  ? const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                      color: appColors.accentblue,
                      width: 4,
                    )))
                  : null,
              child: Text(
                  "${translateDatabase(categoriesModle.categoriesNameAr, categoriesModle.categoriesName)}",
                  style: TextStyle(
                      color: appColors.primaryColor,
                      fontSize: Get.width * 0.04,
                      fontWeight: FontWeight.w600)),
            )
          ],
        ),
      ),
    );
  }
}
