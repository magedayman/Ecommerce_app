import 'package:e_commerce_app/core/classes/StatusRequest.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/constant/appRoutes.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/datasource/remote/addressData/AddressData.dart';
import 'package:e_commerce_app/data/datasource/remote/OrdersData/OrdersData.dart';
import 'package:e_commerce_app/data/model/AddressModel.dart';
import 'package:get/get.dart';

abstract class CheckoutController extends GetxController {
  getSelectedPayment(String val);
  getSelectedOrderType(String val);
  getSelectedShippingAddress(String val);

  getAddressData();

  intialData();

  getCheckoutData();
}

class CheckoutControllerImp extends CheckoutController {
  String? selectedpayment, selectedOrderType, selectedShippingAddress;

  StatusRequest statusRequest = StatusRequest.none;
  appServices service = Get.find();

  // ......data address.......
  AddressData addressData = Get.put(AddressData(Get.find()));
  List<AddressModel> addressDataList = [];

  //------ intial argument from cart ------------//
  String? couponeid, totalproductPrice, coupondiscount;
  //.................................

  //........ instance of checkoutdata source............//
  OrdersData chekoutdata = OrdersData(Get.find());

  @override
  getSelectedPayment(String val) {
    selectedpayment = val;
    update();
  }

  @override
  getSelectedOrderType(String val) {
    selectedOrderType = val;
    update();
  }

  @override
  getSelectedShippingAddress(String val) {
    selectedShippingAddress = val;
    update();
  }

  @override
  getAddressData() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await addressData
        .getViewAddressData(service.sharedpreferance.getString("id")!);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List responseData = response["data"];
        addressDataList
            .addAll(responseData.map((e) => AddressModel.fromJson(e)));
        selectedShippingAddress = addressDataList[0].addressId.toString();
      } else {}
    } else {
      statusRequest = StatusRequest.serverFaluier;
    }

    update();
  }

  @override
  getCheckoutData() async {
    if (selectedpayment == null) {
      return Get.snackbar("Warnning", "Chooes your payment method",
          backgroundColor: appColors.primaryColor,
          colorText: appColors.white,
          animationDuration: const Duration(milliseconds: 400),
          duration: const Duration(milliseconds: 2000));
    }
    if (selectedOrderType == null) {
      return Get.snackbar("Warnning", "Chooes your Shipping Method",
          backgroundColor: appColors.primaryColor,
          colorText: appColors.white,
          animationDuration: const Duration(milliseconds: 400),
          duration: const Duration(milliseconds: 2000));
    }

    if (addressDataList.isEmpty) {
      return Get.snackbar("Warnning", "must add shipping address to your order",
          backgroundColor: appColors.primaryColor,
          colorText: appColors.white,
          animationDuration: const Duration(milliseconds: 400),
          duration: const Duration(milliseconds: 2000));
    }

    statusRequest = StatusRequest.loading;
    update();

    var response = await chekoutdata.getCheckoutData(
      service.sharedpreferance.getString("id")!,
      selectedShippingAddress ?? "0",
      selectedOrderType.toString(),
      "20",
      totalproductPrice!,
      couponeid!,
      selectedpayment.toString(),
      coupondiscount.toString(),
    );

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.offAllNamed(appRoutes.onHomepageRoute);
        Get.snackbar("Succcess", "your order is submit successfully.",
            backgroundColor: appColors.primaryColor,
            colorText: appColors.white,
            animationDuration: const Duration(milliseconds: 1000),
            duration: const Duration(milliseconds: 3000));
      } else {
        Get.snackbar("Error", "Try again Later",
            backgroundColor: appColors.primaryColor,
            colorText: appColors.white,
            animationDuration: const Duration(milliseconds: 1000),
            duration: const Duration(milliseconds: 2000));
      }
    } else {
      statusRequest = StatusRequest.serverFaluier;
    }

    update();
  }

  @override
  intialData() {
    couponeid = Get.arguments["couponid"];
    totalproductPrice = Get.arguments["totalproductPrice"];
    coupondiscount = Get.arguments["coupondiscount"].toString();
  }

  @override
  void onInit() {
    intialData();
    getAddressData();
    super.onInit();
  }
}
