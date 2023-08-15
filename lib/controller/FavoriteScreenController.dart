// ignore_for_file: unused_local_variable

import 'package:e_commerce_app/core/classes/StatusRequest.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/datasource/remote/favoritedata/viewFavoriteData.dart';
import 'package:e_commerce_app/data/model/FavoriteViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class FavoriteScreenController extends GetxController {
  getFavoritedata();
  removeFromFavorite(String favoriteId, String favoriteitemName);
}

class FavoriteScreenControllerImp extends FavoriteScreenController {
  StatusRequest statusRequest = StatusRequest.none;

  Viewfavorite viewfavorite = Viewfavorite(Get.find());

  appServices service = Get.find();

  List<favoriteViewModel> favoritedataList = [];

  @override
  getFavoritedata() async {
    favoritedataList.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await viewfavorite
        .getFavoriteData(service.sharedpreferance.getString("id")!);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List responsedata = response["data"];
        favoritedataList
            .addAll(responsedata.map((e) => favoriteViewModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.noData;
      }
    } else {
      statusRequest = StatusRequest.serverFaluier;
    }

    update();
  }

  @override
  void onInit() {
    super.onInit();
    getFavoritedata();
  }

  @override
  removeFromFavorite(String favoriteId, String favoriteitemName) async {
    var response = await viewfavorite.removeFavoriteData(favoriteId);
    if (favoritedataList.isEmpty) {
      statusRequest = StatusRequest.noData;
    } else {
      favoritedataList
          .removeWhere((element) => element.favoriteId == favoriteId);
    }
    Get.rawSnackbar(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        borderRadius: 15,
        backgroundColor: appColors.primaryColor.withOpacity(0.8),
        icon: const Icon(Icons.check_circle_outlined,
            size: 30, color: appColors.white),
        titleText: const Text("Success",
            style:
                TextStyle(fontWeight: FontWeight.bold, color: appColors.white)),
        duration: const Duration(seconds: 1),
        animationDuration: const Duration(milliseconds: 200),
        messageText: Text(" $favoriteitemName Removed From Favorite",
            style: const TextStyle(color: appColors.white)));

    update();
  }
}
