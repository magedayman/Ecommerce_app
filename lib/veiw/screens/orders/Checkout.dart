import 'package:e_commerce_app/controller/OrdersController/CheckoutController.dart';
import 'package:e_commerce_app/core/classes/Handling_data_View.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/constant/appRoutes.dart';
import 'package:e_commerce_app/core/constant/imageAssets.dart';
import 'package:e_commerce_app/veiw/widgets/CheckoutWidget/HeaderTitleCheckout.dart';
import 'package:e_commerce_app/veiw/widgets/CheckoutWidget/ShippingAddressCheckout.dart';
import 'package:e_commerce_app/veiw/widgets/CheckoutWidget/ShippingMethods.dart';
import 'package:e_commerce_app/veiw/widgets/CheckoutWidget/payemntMethodsCheckout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOut extends GetView<CheckoutControllerImp> {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutControllerImp());
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              controller.getCheckoutData();
            },
            label: const Text("Checkout"),
            backgroundColor: appColors.primaryColor,
            icon: const Icon(Icons.chevron_right_sharp)),
        appBar: AppBar(
          title: const Text(
            'Checkout',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        body: GetBuilder<CheckoutControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: [
                  const SizedBox(
                    height: 10,
                  ),

                  //.........................
                  const HeaderTitleCheckout(title: "Choose payment method"),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(children: [
                      PayemntMethodsCheckout(
                          paymentTitle: "Cash on Delivery",
                          onPressed: () {
                            controller.getSelectedPayment(
                                "0"); // 0 => cash delivery , 1=> card
                          },
                          icon: Icons.delivery_dining_outlined,
                          selected:
                              controller.selectedpayment == "0" ? true : false),
                      const SizedBox(
                        height: 10,
                      ),
                      PayemntMethodsCheckout(
                          paymentTitle: "Credit Card payment ",
                          onPressed: () {
                            controller.getSelectedPayment(
                                "1"); // 0 => cash delivery , 1 => card
                          },
                          icon: Icons.credit_card,
                          selected:
                              controller.selectedpayment == "1" ? true : false),
                    ]),
                  ),

                  //................

                  const HeaderTitleCheckout(title: "Shipping method"),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        ShippingMethods(
                            shippingImage: AppimageAssets.lottieCashDelivery,
                            shippingTitle: "Delivery",
                            onPressd: () {
                              controller.getSelectedOrderType("0");
                            },
                            selected: controller.selectedOrderType == "0"
                                ? true
                                : false),
                        const SizedBox(
                          width: 20,
                        ),
                        ShippingMethods(
                            shippingImage: AppimageAssets.lottiePaymentCard,
                            shippingTitle: "Recive",
                            onPressd: () {
                              controller.getSelectedOrderType("1");
                            },
                            selected: controller.selectedOrderType == "1"
                                ? true
                                : false),
                      ],
                    ),
                  ),
                  if (controller.selectedOrderType == "0")
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const HeaderTitleCheckout(title: "Shipping Address"),
                          if (controller.addressDataList.isEmpty)
                            Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 0),
                                child: Column(
                                  children: [
                                    const Text(
                                      textAlign: TextAlign.center,
                                      "No address is available now",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                          color: appColors.primaryColor),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(appRoutes.addAddress);
                                      },
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        "click here to add address",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color:
                                                appColors.red.withOpacity(0.6)),
                                      ),
                                    ),
                                  ],
                                )),
                          ...List.generate(
                            controller.addressDataList.length,
                            (index) => ShippingAddressCheckout(
                              addressTitle:
                                  "${controller.addressDataList[index].addressName}",
                              addressSubTitle:
                                  " City: ${controller.addressDataList[index].addressCity} - St: ${controller.addressDataList[index].addressStreet}",
                              onPressd: () {
                                controller.getSelectedShippingAddress(controller
                                    .addressDataList[index].addressId!);
                              },
                              selected: controller.selectedShippingAddress ==
                                      controller
                                          .addressDataList[index].addressId
                                  ? true
                                  : false,
                            ),
                          )
                        ],
                      ),
                    ),
                ]),
          ),
        ));
  }
}
