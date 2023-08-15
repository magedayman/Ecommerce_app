import 'package:e_commerce_app/controller/OrdersController/PendingOrdersController.dart';
import 'package:e_commerce_app/core/classes/Handling_data_View.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/constant/appRoutes.dart';
import 'package:e_commerce_app/data/model/PendingOrdersModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class PendingOrders extends GetView<PendingOrdersControllerImp> {
  const PendingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingOrdersControllerImp());
    return Scaffold(
        backgroundColor: appColors.primaryColor.withOpacity(0.01),
        appBar: AppBar(
          title: const Text('Pending Orders'),
        ),
        body: GetBuilder<PendingOrdersControllerImp>(
          builder: (controller) => LiquidPullToRefresh(
            showChildOpacityTransition: false,
            color: appColors.primaryColor,
            springAnimationDurationInMilliseconds: 600,
            animSpeedFactor: 600,
            onRefresh: onRefresh,
            child: HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  itemCount: controller.pendingOrdersdataList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1),
                  itemBuilder: (context, index) {
                    return CardPendingOrders(
                        ordersModeldata:
                            controller.pendingOrdersdataList[index]);
                  },
                )),
          ),
        ));
  }

  Future<void> onRefresh() async {
    controller.pendingOrdersdataList.clear();

    controller.getPendingOrdersData();
  }
}

class CardPendingOrders extends GetView<PendingOrdersControllerImp> {
  final PendingOrdersModel ordersModeldata;
  const CardPendingOrders({super.key, required this.ordersModeldata});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        Get.toNamed(appRoutes.orderDetails, arguments: {
          "ordersList": ordersModeldata,
        });
      },
      child: Card(
        elevation: 3,
        color: appColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  " Order Number : ${ordersModeldata.ordersId}",
                  style: const TextStyle(
                      fontSize: 15,
                      color: appColors.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Divider(
              height: 20,
            ),
            Text(
                "Order type : ${controller.orderTypeValue("${ordersModeldata.ordersType}")}"),
            const Divider(
              height: 20,
            ),
            Text("Order price : ${ordersModeldata.ordersPrice} \$"),
            const Divider(
              height: 20,
            ),
            Text("Delivery price : ${ordersModeldata.ordersPricedelivery} \$"),
            const Divider(
              height: 20,
            ),
            Text(
                "payment method : ${controller.paymentMethodValue("${ordersModeldata.ordersPaymentmethod}")}"),
            const Divider(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  appColors.accentblue.withOpacity(0.7),
                  appColors.accentblue.withOpacity(0.2),
                ]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                  style: const TextStyle(color: appColors.white),
                  "Order status  : ${controller.orderStatusValue("${ordersModeldata.ordersStatus}")}"),
            ),
            const Divider(
              height: 30,
              thickness: 1,
              endIndent: 30,
              indent: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                      "Total price : ${ordersModeldata.ordersTotalprice} \$",
                      style: const TextStyle(
                          color: appColors.red, fontWeight: FontWeight.bold)),
                ),
                // Expanded(
                //   flex: 2,
                //   child: IconButton(
                //       onPressed: () {
                //         Get.toNamed(appRoutes.orderDetails, arguments: {
                //           "ordersList": ordersModeldata,
                //         });
                //       },
                //       icon: const Icon(
                //         Icons.segment_sharp,
                //         size: 35,
                //         color: appColors.primaryColor,
                //       )),
                // ),

                Expanded(
                  flex: 2,
                  child: IconButton.outlined(
                      onPressed: () {
                        controller.deleteOrder(ordersModeldata.ordersId!);
                      },
                      icon: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 2,
                                color: appColors.red.withOpacity(0.3))),
                        child: const Icon(Icons.delete,
                            size: 25, color: appColors.red),
                      )),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
