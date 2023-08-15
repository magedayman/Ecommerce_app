import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/OffersController.dart';
// import 'package:e_commerce_app/controller/HomeController/itemsPageCategoriesController.dart';
import 'package:e_commerce_app/controller/favoriteController.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/constant/appLinkApi.dart';
import 'package:e_commerce_app/core/constant/imageAssets.dart';
import 'package:e_commerce_app/core/functions/translateDataBase.dart';
import 'package:e_commerce_app/data/model/ItemsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class CustomOffersCard extends GetView<OffersControllerImp> {
  final ItemsModel itemsModel;
  const CustomOffersCard({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    // ItemsPageCategoriesControllerImp controller =
    //     Get.put(ItemsPageCategoriesControllerImp());

    return InkWell(
      customBorder:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onTap: () {
        controller.goToItemsDetails(itemsModel);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Expanded(
          child: Container(
            height: 220,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(children: [
                  SizedBox(
                    height: 170,
                    width: 200,
                    child: Hero(
                      tag: "${itemsModel.itemsId}",
                      child: CachedNetworkImage(
                        imageUrl:
                            "${AppLinkApi.apiItemsImage}/${itemsModel.itemsImage}",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Text(
                      "${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: appColors.primaryColor),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: RatingBar.builder(
                      itemSize: 25,
                      initialRating: 2,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          if (itemsModel.itemsDiscount != "0")
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                "${itemsModel.itemspriceDiscount}\$",
                                style: const TextStyle(
                                  color: appColors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          Text(
                            textAlign: TextAlign.center,
                            "${itemsModel.itemsPrice}\$",
                            style: itemsModel.itemsDiscount != "0"
                                ? const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    decorationThickness: 6,
                                    decorationColor: appColors.red,
                                    color: appColors.red,
                                    fontWeight: FontWeight.bold,
                                  )
                                : const TextStyle(
                                    color: appColors.red,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      GetBuilder<FavoriteControllerImp>(
                        builder: (controller) => IconButton(
                            onPressed: () {
                              if (controller.isFavorite[itemsModel.itemsId] ==
                                  "1") {
                                controller.setFavorite(itemsModel.itemsId, "0");
                                controller.removefavorite(
                                    itemsModel.itemsId!, itemsModel.itemsName!);
                              } else {
                                controller.setFavorite(itemsModel.itemsId, "1");
                                controller.addfavorite(
                                    itemsModel.itemsId!, itemsModel.itemsName!);
                              }
                            },
                            icon: controller.isFavorite[itemsModel.itemsId] ==
                                    "1"
                                ? Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: appColors.grey.withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: const Icon(
                                      Icons.favorite,
                                      color: appColors.primaryColor,
                                    ),
                                  )
                                : Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: appColors.grey.withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: const Icon(
                                      Icons.favorite_border_rounded,
                                      color: appColors.primaryColor,
                                    ),
                                  )),
                      )
                    ],
                  )
                ]),
                Container(
                  child: itemsModel.itemsDiscount != "0"
                      ? Positioned(
                          top: -15,
                          left: -20,
                          child: Image.asset(
                            AppimageAssets.saleIcon,
                            height: 60,
                            width: 60,
                          ),
                        )
                      : Positioned(
                          top: 0,
                          child: CircleAvatar(
                              backgroundColor: appColors.primaryColor,
                              foregroundColor: appColors.white,
                              radius: 22,
                              child: Text("${itemsModel.itemsDiscount}%")),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
