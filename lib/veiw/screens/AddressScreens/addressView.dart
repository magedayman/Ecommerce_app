import 'package:e_commerce_app/controller/addressController/addressViewController.dart';
import 'package:e_commerce_app/core/classes/Handling_data_View.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/constant/appRoutes.dart';
import 'package:e_commerce_app/data/model/AddressModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressVeiw extends StatelessWidget {
  const AddressVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressViewControllerImp());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: appColors.primaryColor,
            onPressed: () {
              Get.toNamed(appRoutes.addAddress);
            },
            child: const Icon(
              Icons.add_location_alt_outlined,
              size: 30,
            )),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: appColors.primaryColor),
          titleTextStyle: const TextStyle(
              color: appColors.primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w600),
          title: const Text('address'),
        ),
        body: GetBuilder<AddressViewControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.addressDataList.length,
                itemBuilder: (context, index) {
                  return CardAddress(
                    addressModel: controller.addressDataList[index],
                    onDelete: () {
                      controller.onDeletedAddress(
                          controller.addressDataList[index].addressId!,
                          controller.addressDataList[index].addressName!);
                    },
                  );
                },
              )),
        ));
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onDelete;
  const CardAddress(
      {super.key, required this.addressModel, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
                trailing: IconButton(
                    onPressed: onDelete,
                    icon: const Icon(
                      Icons.remove_circle_outline_rounded,
                      size: 30,
                      color: appColors.red,
                    )),
                leading: const Icon(Icons.location_on_sharp,
                    size: 35, color: appColors.primaryColor),
                title: Text(
                  "Location : ${addressModel.addressName}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: "sans",
                      fontSize: 18),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("City : ${addressModel.addressCity}"),
                    Text("Street : ${addressModel.addressStreet}"),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
