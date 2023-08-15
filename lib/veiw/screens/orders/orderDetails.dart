import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/OrdersController/OrdersDetailsController.dart';
import 'package:e_commerce_app/core/classes/Handling_data_View.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/constant/appLinkApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Order Details'),
        ),
        body: GetBuilder<OrderDetailsControllerImp>(
          builder: (Controller) => HandlingDataView(
            statusRequest: Controller.statusRequest,
            widget: ListView(children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 2,
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    children: [
                      ...List.generate(
                        Controller.ordersDetailListdata.length,
                        (index) => Container(
                          width: 400,
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [
                                    appColors.primaryColor.withOpacity(0.1),
                                    appColors.primaryColor.withOpacity(0.0)
                                  ],
                                  end: Alignment.topCenter,
                                  begin: Alignment.bottomCenter)),
                          child: CachedNetworkImage(
                              height: 200,
                              width: 200,
                              fit: BoxFit.scaleDown,
                              imageUrl:
                                  "${AppLinkApi.apiItemsImage}/${Controller.ordersDetailListdata[index].itemsImage}"),
                        ),
                      ),
                      Table(
                        children: [
                          const TableRow(children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Product",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: appColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Quantity",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: appColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("item Price",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: appColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            ),
                          ]),
                          ...List.generate(
                            Controller.ordersDetailListdata.length,
                            (index) => TableRow(children: [
                              Text(
                                  "${Controller.ordersDetailListdata[index].itemsName}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: appColors.primaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)),
                              Text(
                                  "${Controller.ordersDetailListdata[index].itemsCount}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: appColors.primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400)),
                              Text(
                                  "${Controller.ordersDetailListdata[index].productprice} \$",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: appColors.primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400)),
                            ]),
                          )
                        ],
                      ),
                      Container(
                          padding: const EdgeInsets.only(
                            top: 20,
                            bottom: 5,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Total price : ${Controller.ordersModel.ordersTotalprice} \$",
                            style: const TextStyle(
                              color: appColors.red,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              if (Controller.ordersModel.ordersType == "0")
                Column(
                  children: [
                    Card(
                      margin: const EdgeInsets.only(
                          top: 0, bottom: 10, left: 10, right: 10),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ListTile(
                          title: const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Shippigng Address",
                              style: TextStyle(
                                  fontFamily: "snas",
                                  color: appColors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ),
                          subtitle: Text(
                            "${Controller.ordersModel.addressName} ${Controller.ordersModel.addressCity}-${Controller.ordersModel.addressStreet} avnu",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      "Order Loction",
                      style: TextStyle(
                        color: appColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: GoogleMap(
                          markers: Controller.markers.toSet(),
                          mapType: MapType.normal,
                          initialCameraPosition: Controller.currentPostion!,
                          onMapCreated: (GoogleMapController controller) {
                            Controller.controllerCompleter!
                                .complete(controller);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )
            ]),
          ),
        ));
  }
}
