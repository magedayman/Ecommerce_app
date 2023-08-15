import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/HomeController/itemsPageCategoriesController.dart';
import 'package:e_commerce_app/controller/favoriteController.dart';
import 'package:e_commerce_app/core/classes/Handling_data_View.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/constant/appLinkApi.dart';
import 'package:e_commerce_app/data/model/ItemsModel.dart';
import 'package:e_commerce_app/veiw/widgets/customHomeAppbar.dart';
import 'package:e_commerce_app/veiw/widgets/selectedItemwidget/itemsListCategoriesName.dart';
import 'package:e_commerce_app/veiw/widgets/selectedItemwidget/customItemCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsPageCategoriesControllerImp controller =
        Get.put(ItemsPageCategoriesControllerImp());

    FavoriteControllerImp favoriteControllerImp =
        Get.put(FavoriteControllerImp());
    return Scaffold(
      body: ListView(children: [
        CustomHomeAppbar(
          txtfieldcontroller: controller.searchController,
          title: "Search products",
          onSearchIcon: () {
            controller.onSearch();
          },
          onChanged: (val) {
            controller.checkSearch(val);
          },
          onFavorite: () {
            controller.gotoFavorite();
          },
        ),
        const ItemsListCategories(),
        const SizedBox(height: 10),
        GetBuilder<ItemsPageCategoriesControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusrequest,
              widget: !controller.isSearch
                  ? GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.listItemData.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.6),
                      itemBuilder: (context, index) {
                        // ....
                        favoriteControllerImp.isFavorite[
                                //the key of map
                                controller.listItemData[index]["items_id"]] =
                            // the value of map
                            controller.listItemData[index]["favorite"];

                        //.....
                        return CustItemCard(
                          itemsModel: ItemsModel.fromJson(
                              controller.listItemData[index]),
                        );
                      },
                    )
                  : SearcItemsResult(
                      listModel: controller.itemsModelListSearch)),
        )
      ]),
    );
  }
}

class SearcItemsResult extends GetView<ItemsPageCategoriesControllerImp> {
  final List<ItemsModel> listModel;
  const SearcItemsResult({super.key, required this.listModel});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsPageCategoriesControllerImp());
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, childAspectRatio: 2),
      itemCount: listModel.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                flex: 1,
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
                  height: 200,
                  width: 200,
                  child: CachedNetworkImage(
                      fit: BoxFit.scaleDown,
                      imageUrl:
                          "${AppLinkApi.apiItemsImage}/${listModel[index].itemsImage}"),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "${listModel[index].itemsName}",
                        style: const TextStyle(
                            color: appColors.primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Price :${listModel[index].itemsPrice} \$",
                        style: const TextStyle(
                            color: appColors.primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          controller.goToItemsDetails(listModel[index]);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 2),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: appColors.primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Text(
                            "See More",
                            style: TextStyle(
                                color: appColors.primaryColor, fontSize: 15),
                          ),
                        ),
                      )
                    ],
                  ),
                ))
          ]),
        );
      },
    );
  }
}
