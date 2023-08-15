import 'package:e_commerce_app/core/classes/StatusRequest.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/datasource/remote/favoritedata/favoritedata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class FavoriteController extends GetxController {
  Map isFavorite = {};

  setFavorite(id, value);

  addfavorite(String itemsid, String itemName);
  removefavorite(String itemsid, String itemName);
}

class FavoriteControllerImp extends FavoriteController {
  StatusRequest statusRequest = StatusRequest.none;
  FavoriteData favoritedata = FavoriteData(Get.find());
  appServices service = Get.find();

  @override
  setFavorite(id, value) {
    isFavorite[id] = value;
    update();
  }

  @override
  addfavorite(String itemsid, String itemName) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await favoritedata.addfavoritedata(
        service.sharedpreferance.getString("id")!, itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.rawSnackbar(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            borderRadius: 15,
            backgroundColor: appColors.primaryColor.withOpacity(0.8),
            icon: const Icon(Icons.check_circle_outlined,
                size: 30, color: appColors.white),
            titleText: const Text("Success",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: appColors.white)),
            duration: const Duration(seconds: 1),
            animationDuration: const Duration(milliseconds: 200),
            messageText: Text(" $itemName added to Favorite",
                style: const TextStyle(color: appColors.white)));
      } else {
        statusRequest = StatusRequest.noData;
      }
    } else {
      statusRequest = StatusRequest.serverFaluier;
    }
  }

  @override
  removefavorite(String itemsid, String itemName) async {
    statusRequest = StatusRequest.loading;

    var response = await favoritedata.removefavoritedata(
        service.sharedpreferance.getString("id")!, itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.rawSnackbar(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            borderRadius: 15,
            backgroundColor: appColors.primaryColor.withOpacity(0.8),
            icon: const Icon(Icons.check_circle_outlined,
                size: 30, color: appColors.white),
            titleText: const Text(
              "Success",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: appColors.white),
            ),
            duration: const Duration(seconds: 1),
            animationDuration: const Duration(milliseconds: 200),
            messageText: Text("$itemName Removed from Favorite",
                style: const TextStyle(color: appColors.white)));
      } else {
        statusRequest = StatusRequest.noData;
      }
    } else {
      statusRequest = StatusRequest.serverFaluier;
    }
  }
}
