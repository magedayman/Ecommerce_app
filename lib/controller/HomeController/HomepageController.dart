import 'package:e_commerce_app/core/classes/StatusRequest.dart';
import 'package:e_commerce_app/core/constant/appRoutes.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/datasource/remote/homepagedata/homePage_data.dart';
import 'package:e_commerce_app/data/model/ItemsModel.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:get/get.dart';

abstract class HomepageController extends GetxController {
  getHomepageData();

  goToItemCategories(List categories, int selectedCategory, String categoryId);

  gotoFavorite();

  intialData();

  // checkSearch(val);
  // onSearchItems();
}

class HomepageControllerImp extends HomepageController {
  // StatusRequest statusRequest = StatusRequest.none;

  HomepageData homepageData = HomepageData(Get.find());

  appServices services = Get.find();

  String? lang;

  String? cardTitle = "";
  String? cardBody = "";
  String? deliveryTime = "";

  List categories = [];
  List items = [];
  List settings = [];

  // .......

  StatusRequest statusRequest = StatusRequest.none;
  List<ItemsModel> searchItemsList = [];
  bool isSearch = false;
  TextEditingController? search;

  @override
  void onInit() {
    // FirebaseMessaging.instance.subscribeToTopic("user");
    search = TextEditingController();
    intialData();
    getHomepageData();
    super.onInit();
  }

  getHomepageData() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await homepageData.homepageData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        categories.addAll(response["categories"]);
        items.addAll(response["items"]);
        settings.addAll(response["settings"]);

        cardTitle = settings[0]["settings_title"];
        cardBody = settings[0]["settings_body"];
        deliveryTime = settings[0]["settings_deliveryTime"];

        services.sharedpreferance.setString("deliveryTime", deliveryTime!);
      } else {
        statusRequest = StatusRequest.serverFaluier;
      }
    }

    update();
  }

  goToItemCategories(categories, selectedCategory, categoryId) {
    Get.toNamed(appRoutes.itemsPageScreen, arguments: {
      "categories": categories,
      "selectedCategory": selectedCategory,
      "categoryId": categoryId,
    });
  }

  intialData() {
    lang = services.sharedpreferance.getString("lang");
  }

  gotoFavorite() {
    Get.toNamed(appRoutes.favoriteScreen);
  }

  goToItemsDetails(ItemsModel itemsModel) {
    Get.toNamed(appRoutes.itemsDetailsScreen, arguments: {
      "itemsModel": itemsModel,
    });
  }

  searchItems() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homepageData.searchItemsData(search!.text);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        searchItemsList.clear();
        List searchResponse = response["data"];
        searchItemsList
            .addAll(searchResponse.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.noData;
      }
    } else {
      statusRequest = StatusRequest.serverFaluier;
    }

    update();
  }

  checkSearch(val) {
    if (val == "") {
      isSearch = false;
      //to return home page when no data
      statusRequest = StatusRequest.none;
    }
    update();
  }

  onSearchItems() {
    if (search!.text == "") {
      isSearch = false;
    } else {
      isSearch = true;
      searchItems();
    }
    update();
  }
}
