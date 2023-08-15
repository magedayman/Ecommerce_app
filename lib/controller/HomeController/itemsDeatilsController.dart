import 'package:e_commerce_app/core/classes/StatusRequest.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/data/model/ItemsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/services/services.dart';
import '../../data/datasource/remote/cart/Cartdata.dart';

abstract class ItemsDetailsController extends GetxController {
  intialdata();
  onaddCart();
  onDeleteCart();
}

class ItemsDetailsControllerImp extends ItemsDetailsController {
  late ItemsModel itemsModel;

  // CartControllerImp cartcontrollerImp = Get.put(CartControllerImp());

  int cartItemsCount = 0;

  StatusRequest statusRequest = StatusRequest.none;
  appServices service = Get.find();
  CartData cartData = CartData(Get.find());

  @override
  void onInit() {
    intialdata();
    super.onInit();
  }

  @override
  intialdata() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments["itemsModel"];
    cartItemsCount = await countItemsCart(itemsModel.itemsId!);

    statusRequest = StatusRequest.success;

    update();
  }

//for response buttons on card cart
  @override
  onDeleteCart() {
    if (cartItemsCount > 0) {
      deleteCart(itemsModel.itemsId!, itemsModel.itemsName!);
      cartItemsCount--;
      update();
    }
  }

  @override
  onaddCart() {
    addCart(itemsModel.itemsId!, itemsModel.itemsName!);
    cartItemsCount++;
    update();
  }

  addCart(String itemsid, String itemName) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCartData(
        service.sharedpreferance.getString("id")!, itemsid);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.snackbar("Success", "$itemName added to Cart",
            animationDuration: const Duration(milliseconds: 100),
            duration: const Duration(milliseconds: 800),
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.all(20));
      } else {
        statusRequest = StatusRequest.noData;
      }
    } else {
      statusRequest = StatusRequest.serverFaluier;
    }

    update();
  }

  deleteCart(String itemsid, String itemName) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCarttData(
        service.sharedpreferance.getString("id")!, itemsid);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.snackbar("success", "$itemName Deleted from Cart",
            animationDuration: const Duration(milliseconds: 100),
            duration: const Duration(milliseconds: 800),
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.all(20));
      } else {
        Get.snackbar("Hint", "$itemName Not already added to Cart",
            animationDuration: const Duration(milliseconds: 100),
            duration: const Duration(milliseconds: 800),
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.all(20));
      }
    } else {
      statusRequest = StatusRequest.serverFaluier;
    }

    update();
  }

  countItemsCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.itemsCountCartData(
        service.sharedpreferance.getString("id")!, itemsid);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        int cartCountItems = 0;
        cartCountItems = int.parse(response["data"]);
        print("$cartCountItems");
        return cartCountItems;
      }
    } else {
      print("faield response");
      statusRequest = StatusRequest.serverFaluier;
    }

    update();
  }

  List itemsProductColors = [
    {"color": "black", "id": 1, "active": "1"},
    {"color": "grey", "id": 2, "active": "0"},
    {"color": "blue", "id": 3, "active": "0"},
  ];
}
