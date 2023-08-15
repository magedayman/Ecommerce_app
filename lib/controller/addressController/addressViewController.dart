import 'package:e_commerce_app/core/classes/StatusRequest.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/datasource/remote/addressData/AddressData.dart';
import 'package:e_commerce_app/data/model/AddressModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddressViewController extends GetxController {
  getViewaddressData();
  onDeletedAddress(String addressId, String addressName);
}

class AddressViewControllerImp extends AddressViewController {
  AddressData addressData = AddressData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<AddressModel> addressDataList = [];
  appServices services = Get.find();

  @override
  getViewaddressData() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await addressData
        .getViewAddressData(services.sharedpreferance.getString("id")!);

    // print("$response,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        // addressDataList.addAll(response["data"]);
        List responsedata = response["data"];
        addressDataList
            .addAll(responsedata.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.noData;
      }
    } else {
      statusRequest = StatusRequest.serverFaluier;
    }

    update();
  }

  @override
  onDeletedAddress(String addressid, String addressName) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await addressData.getDeleteAddressData(addressid);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        addressDataList
            .removeWhere((element) => element.addressId == addressid);
        Get.snackbar("Success", "$addressName Deleted from Your address List",
            animationDuration: const Duration(milliseconds: 100),
            duration: const Duration(milliseconds: 1200),
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.all(20));
        if (addressDataList.isEmpty) {
          statusRequest = StatusRequest.noData;
        }
      } else {
        print("failellllllllllllllllllllllllllllll");
      }
    } else {
      statusRequest = StatusRequest.serverFaluier;
    }

    update();
  }

  @override
  void onInit() {
    getViewaddressData();
    super.onInit();
  }
}
