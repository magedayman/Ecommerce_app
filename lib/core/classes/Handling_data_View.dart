import 'package:e_commerce_app/core/classes/StatusRequest.dart';
import 'package:e_commerce_app/core/constant/imageAssets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final Widget widget;
  final StatusRequest statusRequest;
  const HandlingDataView(
      {super.key, required this.widget, required this.statusRequest});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppimageAssets.lottieLoadingFour,
                height: 200, width: 200))
        : statusRequest == StatusRequest.offlineNetwork
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Lottie.asset(AppimageAssets.lottieNoNetwork,
                        height: 200, width: 300),
                  ),
                  const Center(
                    child: Text("Network failed connection "),
                  )
                ],
              )
            : statusRequest == StatusRequest.serverFaluier
                ? Center(
                    child: Lottie.asset(AppimageAssets.lottieServerFailuer))
                : statusRequest == StatusRequest.noData
                    ? Center(
                        child: Lottie.asset(AppimageAssets.lottieNodataFound))
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final Widget widget;
  final StatusRequest statusRequest;
  const HandlingDataRequest(
      {super.key, required this.widget, required this.statusRequest});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppimageAssets.lottieLoadingThree,
                height: 100, width: 100))
        : statusRequest == StatusRequest.offlineNetwork
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Lottie.asset(AppimageAssets.lottieNoNetwork,
                        height: 100, width: 200),
                  ),
                  const Center(
                    child: Text("Network failed connection "),
                  )
                ],
              )
            : statusRequest == StatusRequest.serverFaluier
                ? Center(
                    child: Lottie.asset(AppimageAssets.lottieServerFailuer))
                : widget;
  }
}
