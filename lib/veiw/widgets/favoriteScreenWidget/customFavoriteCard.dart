import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/FavoriteScreenController.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/constant/appLinkApi.dart';
import 'package:e_commerce_app/core/functions/translateDataBase.dart';
import 'package:e_commerce_app/data/model/FavoriteViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class CustomFavoriteCard extends GetView<FavoriteScreenControllerImp> {
  final favoriteViewModel favoriteModel;
  const CustomFavoriteCard({super.key, required this.favoriteModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(children: [
          SizedBox(
            height: 160,
            width: 200,
            child: Hero(
              tag: "${favoriteModel.itemsId}",
              child: CachedNetworkImage(
                imageUrl:
                    "${AppLinkApi.apiItemsImage}/${favoriteModel.itemsImage}",
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Text(
            "${translateDatabase(favoriteModel.itemsNameAr, favoriteModel.itemsName)}",
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: appColors.primaryColor),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Text(
              textAlign: TextAlign.center,
              "Discount : ${favoriteModel.itemsDiscount}%",
              style: const TextStyle(
                  fontSize: 13,
                  color: appColors.grey,
                  fontWeight: FontWeight.w500),
            ),
          ),
          RatingBar.builder(
            itemSize: 20,
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
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${favoriteModel.itemsPrice}\$",
                  style: const TextStyle(
                      color: appColors.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {
                      controller.removeFromFavorite(
                          favoriteModel.favoriteId!, favoriteModel.itemsName!);
                    },
                    icon: const Icon(
                      Icons.remove_circle_outline_rounded,
                      size: 30,
                      color: appColors.red,
                    ))
              ],
            ),
          )
        ]),
      ),
    );
  }
}
