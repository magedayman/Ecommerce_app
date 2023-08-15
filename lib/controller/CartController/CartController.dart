import 'package:e_commerce_app/core/classes/StatusRequest.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/constant/appRoutes.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/datasource/remote/cart/Cartdata.dart';
import 'package:e_commerce_app/data/model/CartViewModel.dart';
import 'package:e_commerce_app/data/model/CouponModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  addCart(String itemsid, String itemName);
  deleteCart(String itemsid, String itemName);
  // countItemsCart(String itemsid);

  resetVar();
  refreshView();

  checkCouponData();
  getfinalTotalPrice();

  gotoCheckoutpage();
}

class CartControllerImp extends CartController {
  StatusRequest statusRequest = StatusRequest.none;
  appServices service = Get.find();
  CartData cartData = CartData(Get.find());

  List<CartViewModel> cartviewdataList = [];
  double totalproductPrice = 0.0;
  int totalproductCount = 0;

  //...coupone...
  TextEditingController? controllerCoupon;
  CouponModel? couponModel;
  int? discountCoupon = 0;
  String? couponName, couponeid;
  //...

  @override
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

  @override
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

  cartView() async {
    statusRequest = StatusRequest.loading;
    update();

    var response =
        await cartData.viewCartData(service.sharedpreferance.getString("id")!);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List cartViewResponse = response["cartdata"];
        Map productcountPrice = response["countandprice"];
        cartviewdataList
            .addAll(cartViewResponse.map((e) => CartViewModel.fromJson(e)));
        totalproductCount = int.parse(productcountPrice["allitemsCount"]);
        totalproductPrice = double.parse(productcountPrice["alltotalprice"]);

        print("$totalproductCount");
      } else {
        statusRequest = StatusRequest.noData;
      }
    } else {
      if (cartviewdataList.isEmpty) {
        statusRequest = StatusRequest.none;
        Get.snackbar("Shopping Cart is empty", "Discover our products ");
      }
    }

    update();
  }

  @override
  checkCouponData() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.getCouponData(controllerCoupon!.text);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Map<String, dynamic> dataCoupon = response["data"];
        couponModel = CouponModel.fromJson(dataCoupon);

        discountCoupon = int.parse(couponModel!.couponDiscount!);
        couponName = couponModel!.couponName;
        couponeid = couponModel!.couponId;

        Get.rawSnackbar(
            title: "Congratulation",
            message:
                "Coupon  ($couponName)  applying Successfully you have ${discountCoupon}% discount",
            animationDuration: const Duration(milliseconds: 800),
            duration: const Duration(milliseconds: 2500),
            backgroundColor: appColors.primaryColor);
      } else {
        discountCoupon = 0;
        couponName = null;
        couponeid = null;

        Get.rawSnackbar(
            title: "Failed",
            message: "Error applying Coupon",
            animationDuration: const Duration(milliseconds: 500),
            duration: const Duration(milliseconds: 1400),
            backgroundColor: appColors.primaryColor);
      }
    } else {
      statusRequest = StatusRequest.serverFaluier;
    }

    update();
  }

  @override
  getfinalTotalPrice() {
    return (totalproductPrice - totalproductPrice * discountCoupon! / 100);
  }

  @override
  void onInit() {
    controllerCoupon = TextEditingController();
    cartView();
    super.onInit();
  }

  @override
  resetVar() {
    totalproductPrice = 0.0;
    totalproductCount = 0;
    cartviewdataList.clear();
  }

  @override
  refreshView() {
    resetVar();
    cartView();
  }

  @override
  gotoCheckoutpage() {
    if (cartviewdataList.isEmpty) {
      return Get.rawSnackbar(
          animationDuration: const Duration(milliseconds: 300),
          duration: const Duration(milliseconds: 2500),
          backgroundColor: appColors.primaryColor,
          title: "Warnning",
          message: "Shopping cart is Empty to checkout");
    }
    Get.toNamed(appRoutes.checOut, arguments: {
      "couponid": couponeid ?? "0",
      "totalproductPrice": totalproductPrice.toString(),
      "coupondiscount": discountCoupon.toString(),
    });
  }
}
