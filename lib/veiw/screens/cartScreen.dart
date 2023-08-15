import 'package:e_commerce_app/controller/CartController/CartController.dart';
import 'package:e_commerce_app/core/classes/Handling_data_View.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/veiw/widgets/CartWdget/CustomButtomCart.dart';
import 'package:e_commerce_app/veiw/widgets/CartWdget/CustomCarditemsCart.dart';
import 'package:e_commerce_app/veiw/widgets/CartWdget/CustomCountItemsCart.dart';
import 'package:e_commerce_app/veiw/widgets/CartWdget/CustomNavigationBottomCart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: appColors.primaryColor,
              )),
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: const TextStyle(
              color: appColors.primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w500),
          centerTitle: true,
          title: const Text('Shopping Cart'),
        ),
        bottomNavigationBar: GetBuilder<CartControllerImp>(
          builder: (controller) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomNavigationBottomCart(
                controllerCoupon: controller.controllerCoupon!,
                onaApplyCoupon: () {
                  controller.checkCouponData();
                },
                price: "${controller.totalproductPrice} \$",
                shipping: "200\$",
                finaltotalPrice: "${controller.getfinalTotalPrice()}\$",
                couponDis: "${controller.discountCoupon} %",
              ),
              CustomButtomCart(
                  buttontext: "Order now ",
                  onPressed: () {
                    controller.gotoCheckoutpage();
                  })
            ],
          ),
        ),

        //.........
        body: GetBuilder<CartControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(children: [
              CustomCountItemsCart(
                  title:
                      "you have ${controller.totalproductCount} product in your cart"),
              ...List.generate(
                controller.cartviewdataList.length,
                (index) => CustomCarditemsCart(
                  titleproduct:
                      "${controller.cartviewdataList[index].itemsName}",
                  productprice:
                      "${controller.cartviewdataList[index].productprice}",
                  countty: "${controller.cartviewdataList[index].productcount}",
                  itemImage: "${controller.cartviewdataList[index].itemsImage}",
                  onRemoveCart: () async {
                    await controller.deleteCart(
                        controller.cartviewdataList[index].itemsId!,
                        controller.cartviewdataList[index].itemsName!);
                    controller.refreshView();
                  },
                  onaddCart: () async {
                    await controller.addCart(
                        controller.cartviewdataList[index].itemsId!,
                        controller.cartviewdataList[index].itemsName!);
                    controller.refreshView();
                  },
                ),
              )
            ]),
          ),
        ));
  }
}
