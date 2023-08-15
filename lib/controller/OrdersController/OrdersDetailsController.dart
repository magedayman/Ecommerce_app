import 'dart:async';

import 'package:e_commerce_app/core/classes/StatusRequest.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/data/datasource/remote/OrdersData/OrdersData.dart';
import 'package:e_commerce_app/data/model/OrdersDetailsModel.dart';
import 'package:e_commerce_app/data/model/PendingOrdersModel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class OrderDetailsController extends GetxController {
  getCurrentLocation();

  getorderDetailsData();
}

class OrderDetailsControllerImp extends OrderDetailsController {
  late PendingOrdersModel ordersModel;

  List<OrdersDetailsModel> ordersDetailListdata = [];

//.
  StatusRequest statusRequest = StatusRequest.none;
  OrdersData orderdata = Get.put(OrdersData(Get.find()));
  Completer<GoogleMapController>? controllerCompleter;
  Position? postion;
  List<Marker> markers = [];
  CameraPosition? currentPostion;

  double? lat, lang;

  @override
  getCurrentLocation() async {
    if (ordersModel.ordersType == "0") {
      currentPostion = CameraPosition(
        target: LatLng(double.parse(ordersModel.addressLat!),
            double.parse(ordersModel.addressLang!)),
        zoom: 8.4746,
      );
      markers.add(Marker(
        markerId: MarkerId("1"),
        position: LatLng(double.parse(ordersModel.addressLat!),
            double.parse(ordersModel.addressLang!)),
      ));
    }
  }

  @override
  void onInit() {
    ordersModel = Get.arguments["ordersList"];
    getorderDetailsData();
    getCurrentLocation();
    controllerCompleter = Completer<GoogleMapController>();
    super.onInit();
  }

  @override
  getorderDetailsData() async {
    statusRequest = StatusRequest.loading;
    var response = await orderdata.getOrderDetailsData(ordersModel.ordersId!);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        print("${response}===============================");

        List responsedata = response["data"];
        ordersDetailListdata
            .addAll(responsedata.map((e) => OrdersDetailsModel.fromJson(e)));
      } else {
        Get.snackbar("Error", "No orders here");
      }
    } else {
      print("faield server ---------------------------");
      statusRequest = StatusRequest.serverFaluier;
    }

    update();
  }
}
