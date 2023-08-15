import 'package:e_commerce_app/controller/OffersController.dart';
import 'package:e_commerce_app/controller/favoriteController.dart';
import 'package:e_commerce_app/core/classes/Handling_data_View.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/veiw/screens/Offers/customOffersCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class Offers extends GetView<OffersControllerImp> {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersControllerImp());
    Get.put(FavoriteControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Offers'),
      ),
      body: LiquidPullToRefresh(
        showChildOpacityTransition: false,
        color: appColors.primaryColor,
        springAnimationDurationInMilliseconds: 600,
        animSpeedFactor: 600,
        onRefresh: onRefresh,
        child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            children: [
              GetBuilder<OffersControllerImp>(
                builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, childAspectRatio: 1),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.itemsModelListdata.length,
                    itemBuilder: (context, index) {
                      return CustomOffersCard(
                          itemsModel: controller.itemsModelListdata[index]);
                    },
                  ),
                ),
              )
            ]),
      ),
    );
  }

  Future<void> onRefresh() async {
    controller.itemsModelListdata.clear();
    controller.getOffersData();
  }
}
