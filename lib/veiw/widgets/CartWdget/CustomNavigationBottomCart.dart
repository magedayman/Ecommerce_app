import 'package:e_commerce_app/controller/CartController/CartController.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNavigationBottomCart extends StatelessWidget {
  const CustomNavigationBottomCart({
    super.key,
    required this.price,
    required this.shipping,
    required this.finaltotalPrice,
    required this.controllerCoupon,
    required this.onaApplyCoupon,
    required this.couponDis,
  });
  final String price, shipping, finaltotalPrice, couponDis;
  final TextEditingController controllerCoupon;
  final void Function()? onaApplyCoupon;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        GetBuilder<CartControllerImp>(
            builder: (controller) => controller.couponName == null
                ? Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(children: [
                      Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: controllerCoupon,
                            decoration: InputDecoration(
                                hintText: "coupon code",
                                hintStyle: TextStyle(
                                    fontFamily: "sans",
                                    color: appColors.grey.withOpacity(0.3),
                                    fontSize: 16),
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          )),
                      const SizedBox(width: 5),
                      Expanded(
                          flex: 1,
                          child: Container(
                            height: 42,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: appColors.primaryColor),
                            child: MaterialButton(
                              onPressed: onaApplyCoupon,
                              child: const Text(
                                textAlign: TextAlign.center,
                                "apply coupon",
                                style: TextStyle(
                                    color: appColors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ))
                    ]),
                  )
                : Container(
                    margin: const EdgeInsets.all(10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                        color: appColors.primaryColor.withOpacity(0.1),
                        border: Border.all(color: appColors.primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      " Coupon *${controller.couponName}* applying Successfully",
                      style: const TextStyle(
                          color: appColors.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 13),
                    ),
                  )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: Text("price",
                  style: TextStyle(
                      color: appColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: Text(price,
                  style: const TextStyle(
                      color: appColors.primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15)),
            ),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: Text("Shipping",
                  style: TextStyle(
                      color: appColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: Text(shipping,
                  style: const TextStyle(
                      color: appColors.primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15)),
            ),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: Text("Coupon discount",
                  style: TextStyle(
                      color: appColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: Text(couponDis,
                  style: const TextStyle(
                      color: appColors.primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15)),
            ),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Text("Total price",
                  style: TextStyle(
                      color: appColors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 15)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text(finaltotalPrice,
                  style: const TextStyle(
                      color: appColors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 15)),
            ),
          ],
        ),
      ]),
    );
  }
}
