import 'package:e_commerce_app/core/classes/StatusRequest.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/datasource/remote/OrdersData/OrdersData.dart';
import 'package:e_commerce_app/data/model/PendingOrdersModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrdersArchiveController extends GetxController {
  getArchiveOrdersData();
  orderTypeValue(String val);
  paymentMethodValue(String val);
  orderStatusValue(String val);

  getRatingdata(String ordersid, String rating, String ratingcomment);
}

class OrdersArchiveControllerImp extends OrdersArchiveController {
  StatusRequest statusRequest = StatusRequest.none;
  OrdersData ordersData = Get.put(OrdersData(Get.find()));

  appServices services = Get.find();

  List<PendingOrdersModel> archiveOrdersdataList = [];

  int? indexRating;

  @override
  getArchiveOrdersData() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await ordersData
        .getArchiveOrdersData(services.sharedpreferance.getString("id")!);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List responseData = response["data"];
        archiveOrdersdataList
            .addAll(responseData.map((e) => PendingOrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.noData;
      }
    } else {
      print("server faile");
    }

    update();
  }

  @override
  String orderTypeValue(String val) {
    if (val == "1") {
      return "Recive";
    }
    return "Delivery";
  }

  @override
  String paymentMethodValue(String val) {
    if (val == "1") {
      return "Credit Card payment";
    }
    return "Cash on Delivery";
  }

  @override
  String orderStatusValue(String val) {
    if (val == "0") {
      return "Order Review";
    } else if (val == "1") {
      return "Prepar Order";
    } else if (val == "2") {
      return "Order on the way";
    } else if (val == "3") {
      return "Order deliverd";
    }
    return 'Order archive';
  }

  @override
  void onInit() {
    super.onInit();
    getArchiveOrdersData();
  }

  @override
  getRatingdata(String ordersid, String rating, String ratingcomment) async {
    archiveOrdersdataList.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response =
        await ordersData.getRatingdata(ordersid, rating, ratingcomment);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        getArchiveOrdersData();
        Get.rawSnackbar(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            backgroundColor: appColors.primaryColor,
            icon: const Icon(Icons.check_circle_outlined,
                size: 30, color: appColors.white),
            titleText: const Text("Success",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: appColors.white)),
            duration: const Duration(seconds: 2),
            animationDuration: const Duration(milliseconds: 800),
            messageText: const Text("Thank you for your comment",
                style: TextStyle(color: appColors.white)));
      } else {
        print("no data");
        statusRequest = StatusRequest.noData;
      }
    } else {
      print("server failed");
      statusRequest = StatusRequest.serverFaluier;
    }

    update();
  }
}
