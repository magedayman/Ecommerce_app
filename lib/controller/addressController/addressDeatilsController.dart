import 'package:e_commerce_app/core/classes/StatusRequest.dart';
import 'package:e_commerce_app/core/constant/appRoutes.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/datasource/remote/addressData/AddressData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddressDetailsController extends GetxController {
  intialdataAgrs();

  addDataAddress();
}

class AddressDetailsControllerImp extends AddressDetailsController {
  String? lang, lat;

  StatusRequest statusRequest = StatusRequest.none;
  AddressData addressData = AddressData(Get.find());

  appServices services = Get.find();

  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  intialdataAgrs() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    lat = Get.arguments["lat"];
    lang = Get.arguments["lang"];
  }

  @override
  void onInit() {
    super.onInit();
    intialdataAgrs();
  }

  @override
  addDataAddress() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await addressData.getAddAddressData(
          services.sharedpreferance.getString("id")!,
          name!.text,
          city!.text,
          street!.text,
          lat!,
          lang!);

      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offAllNamed(appRoutes.onHomepageRoute);
        }
      } else {
        Get.offAllNamed(appRoutes.onHomepageRoute);
      }

      update();
    } else {
      print("not validate ");
    }
  }
}
