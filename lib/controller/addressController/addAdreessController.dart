import 'dart:async';

import 'package:e_commerce_app/core/classes/StatusRequest.dart';
import 'package:e_commerce_app/core/constant/appRoutes.dart';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class AddaddressController extends GetxController {
  getCurrentLocation();

  intiPermissionlocation();

  setMarkers(LatLng latLng);

  goToAddressDetailsPage();
}

class AddaddressControllerImp extends AddaddressController {
  StatusRequest statusRequest = StatusRequest.loading;
  Completer<GoogleMapController>? controllerCompleter;
  Position? postion;
  List<Marker> markers = [];
  CameraPosition? currentPostion;

  double? lat, lang;

  @override
  getCurrentLocation() async {
    postion = await Geolocator.getCurrentPosition();
    currentPostion = CameraPosition(
      target: LatLng(postion!.latitude, postion!.longitude),
      zoom: 14.4746,
    );
    setMarkers(LatLng(postion!.latitude, postion!.longitude));

    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    intiPermissionlocation();
    getCurrentLocation();

    controllerCompleter = Completer<GoogleMapController>();

    super.onInit();
  }

  @override
  intiPermissionlocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("hint", "please turn on Gps loction service");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("warninng",
            "please choose the current Permmisson to loction service ");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar(
          "warninng", "app cant chooes loction without Gps loction service");
    }
  }

  @override
  setMarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"), position: latLng));

    lat = latLng.latitude;
    lang = latLng.longitude;
    update();
  }

  @override
  goToAddressDetailsPage() {
    Get.toNamed(appRoutes.detailsAddress, arguments: {
      "lat": lat.toString(),
      "lang": lang.toString(),
    });
  }
}
