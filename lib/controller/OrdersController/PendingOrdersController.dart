import 'package:e_commerce_app/core/classes/StatusRequest.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/datasource/remote/OrdersData/OrdersData.dart';
import 'package:e_commerce_app/data/model/PendingOrdersModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class PendingOrdersController extends GetxController {
  getPendingOrdersData();

  deleteOrder(String orderid);

  refrehOrder();

  //....val of number database name

  String orderTypeValue(String val);
  String paymentMethodValue(String val);
  String orderStatusValue(String val);
}

class PendingOrdersControllerImp extends PendingOrdersController {
  OrdersData ordersData = OrdersData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<PendingOrdersModel> pendingOrdersdataList = [];
  appServices services = Get.find();

  @override
  getPendingOrdersData() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await ordersData
        .getPendingOrdersData(services.sharedpreferance.getString("id")!);

    print("${response} ...............................");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List responseData = response["data"];
        pendingOrdersdataList
            .addAll(responseData.map((e) => PendingOrdersModel.fromJson(e)));
      } else {
        Get.snackbar("Empty Orders", "Check your active orders",
            snackPosition: SnackPosition.TOP,
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10));
        print("faield----------------data --------------");
        statusRequest = StatusRequest.none;
        update();
      }
    } else {
      statusRequest = StatusRequest.none;
      Get.snackbar("Error", "Something wrong try again",
          backgroundColor: appColors.primaryColor,
          colorText: appColors.white,
          animationDuration: const Duration(milliseconds: 400),
          duration: const Duration(milliseconds: 2000));
    }
    update();
  }

  @override
  void onInit() {
    getPendingOrdersData();
    super.onInit();
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
  deleteOrder(String orderid) async {
    pendingOrdersdataList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getOrderDeleteData(orderid);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        refrehOrder();
        Get.rawSnackbar(
            animationDuration: const Duration(milliseconds: 500),
            duration: const Duration(milliseconds: 1800),
            backgroundColor: appColors.primaryColor,
            icon: const Icon(Icons.check_circle_outlined),
            title: "Success",
            message: "Order Number $orderid successfully deleted");
      } else {
        Get.snackbar("error", "wrong value ...");
      }
    } else {
      statusRequest = StatusRequest.serverFaluier;
    }

    update();
  }

  @override
  refrehOrder() {
    getPendingOrdersData();
  }
}
