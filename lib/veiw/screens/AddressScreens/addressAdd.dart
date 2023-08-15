import 'package:e_commerce_app/controller/addressController/addAdreessController.dart';
import 'package:e_commerce_app/core/classes/Handling_data_View.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/veiw/widgets/authWidget/customButtonAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddaddressControllerImp());
    return Scaffold(
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
          title: const Text('add new address'),
        ),
        body: Container(
            child: GetBuilder<AddaddressControllerImp>(
          builder: (addaddressControllerImp) => HandlingDataView(
            statusRequest: addaddressControllerImp.statusRequest,
            widget: Column(
              children: [
                // <!..................google map ...................>
                if (addaddressControllerImp.currentPostion != null)
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        GoogleMap(
                          markers: addaddressControllerImp.markers.toSet(),
                          onTap: (argument) {
                            addaddressControllerImp.setMarkers(argument);
                          },
                          mapType: MapType.normal,
                          initialCameraPosition:
                              addaddressControllerImp.currentPostion!,
                          onMapCreated: (GoogleMapController controller) {
                            addaddressControllerImp.controllerCompleter!
                                .complete(controller);
                          },
                        ),
                        Positioned(
                          bottom: 0,
                          child: SizedBox(
                            width: 300,
                            child: CustomButtonAuth(
                                buttontext: "Next",
                                onPressed: () {
                                  addaddressControllerImp
                                      .goToAddressDetailsPage();
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
              ],
            ),
          ),
        )));
  }
}
