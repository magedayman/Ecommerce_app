// ignore_for_file: override_on_non_overriding_member

import 'package:e_commerce_app/core/classes/StatusRequest.dart';
import 'package:e_commerce_app/core/constant/appRoutes.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/datasource/remote/homepagedata/homePage_data.dart';
import 'package:e_commerce_app/data/datasource/remote/itemspageData/itemsdata.dart';
import 'package:e_commerce_app/data/model/ItemsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsPageCategoriesController extends GetxController {
  intialData();
  changeInnerItems(int val, String valId);

  getItemData(String categoryId);

  goToItemsDetails(ItemsModel itemsModel);
}

class ItemsPageCategoriesControllerImp extends ItemsPageCategoriesController {
  late List categories;
  late int selectedCategoriy;
  String? categoryId;
  String? deliveryTime = "";

  StatusRequest statusrequest = StatusRequest.none;
  List listItemData = [];
  ItemData itemdata = ItemData(Get.find());
  appServices services = Get.find();

// search  Component
//.............................................
//.............................................
//................................................

  bool isSearch = false;

  TextEditingController? searchController;

  List<ItemsModel> itemsModelListSearch = [];
  HomepageData homepageData = HomepageData(Get.find());

  checkSearch(val) {
    if (val == "") {
      isSearch = false;

      statusrequest = StatusRequest.none;
    }

    update();
  }

  onSearch() {
    if (searchController!.text == "") {
      isSearch = false;
    } else {
      isSearch = true;
      searchDataItems();
    }
    update();
  }

  searchDataItems() async {
    statusrequest = StatusRequest.loading;
    update();
    var response = await homepageData.searchItemsData(searchController!.text);

    statusrequest = handlingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response["status"] == "success") {
        itemsModelListSearch.clear();
        print("$response");
        List responseSearch = response["data"];
        itemsModelListSearch
            .addAll(responseSearch.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusrequest = StatusRequest.noData;
      }
    } else {
      statusrequest = StatusRequest.serverFaluier;
    }

    update();
  }

// .........................................
//..............................................
//..............................................
  @override
  intialData() {
    categories = Get.arguments["categories"];
    selectedCategoriy = Get.arguments["selectedCategory"];
    categoryId = Get.arguments["categoryId"];
    deliveryTime = services.sharedpreferance.getString('deliveryTime');
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    intialData();
    getItemData(categoryId!);

    super.onInit();
  }

  @override
  changeInnerItems(int val, valId) {
    selectedCategoriy = val;
    categoryId = valId;
    getItemData(categoryId!);
    update();
  }

  @override
  getItemData(categoryId) async {
    listItemData.clear();
    statusrequest = StatusRequest.loading;
    update();
    var response = await itemdata.onPostItemData(
        categoryId, services.sharedpreferance.getString("id")!);
    statusrequest = handlingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response["status"] == "success") {
        listItemData.addAll(response["data"]);
      } else {
        statusrequest = StatusRequest.noData;
      }
    } else {
      statusrequest = StatusRequest.serverFaluier;
    }
    update();
  }

  @override
  goToItemsDetails(ItemsModel itemsModel) {
    Get.toNamed(appRoutes.itemsDetailsScreen, arguments: {
      "itemsModel": itemsModel,
    });
  }

  gotoFavorite() {
    Get.toNamed(appRoutes.favoriteScreen);
  }
}
