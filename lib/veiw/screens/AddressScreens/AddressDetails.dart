import 'package:e_commerce_app/controller/addressController/addressDeatilsController.dart';
import 'package:e_commerce_app/core/classes/Handling_data_View.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/constant/imageAssets.dart';
import 'package:e_commerce_app/core/functions/validatInputField.dart';
import 'package:e_commerce_app/veiw/widgets/authWidget/customButtonAuth.dart';
import 'package:e_commerce_app/veiw/widgets/authWidget/customTextFieldAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressDetails extends StatelessWidget {
  const AddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressDetailsControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: appColors.primaryColor),
          centerTitle: true,
          titleTextStyle: const TextStyle(
              color: appColors.primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w600),
          title: const Text('Address details'),
        ),
        body: GetBuilder<AddressDetailsControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    height: 200,
                    width: 200,
                    child: Image.asset(
                      AppimageAssets.loctionIcon,
                      fit: BoxFit.scaleDown,
                    )),
                Form(
                    key: controller.formState,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 25),
                          child: const Text(
                            textAlign: TextAlign.center,
                            "please Type Your current Address Information",
                            style: TextStyle(
                                color: appColors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Trajan Pro"),
                          ),
                        ),
                        customTextFieldAuth(
                          labelText: "Address name",
                          hinttxet: "type your address name",
                          suffixIcon: const Icon(Icons.location_on_outlined),
                          keyboardType: TextInputType.text,
                          controller: controller.name,
                          validator: (val) {
                            return validatInputField(val!, 3, 40, "");
                          },
                        ),
                        customTextFieldAuth(
                          labelText: "City",
                          hinttxet: "type your City",
                          suffixIcon: const Icon(Icons.location_city),
                          keyboardType: TextInputType.text,
                          controller: controller.city,
                          validator: (val) {
                            return validatInputField(val!, 3, 40, "");
                          },
                        ),
                        customTextFieldAuth(
                          labelText: "Street",
                          hinttxet: "type your Street",
                          suffixIcon: const Icon(Icons.storage_rounded),
                          keyboardType: TextInputType.text,
                          controller: controller.street,
                          validator: (val) {
                            return validatInputField(val!, 3, 40, "");
                          },
                        ),
                        SizedBox(
                          width: 300,
                          child: CustomButtonAuth(
                              buttontext: "submit",
                              onPressed: () {
                                controller.addDataAddress();
                              }),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
