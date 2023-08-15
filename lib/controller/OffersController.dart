import 'package:e_commerce_app/core/classes/StatusRequest.dart';
import 'package:e_commerce_app/core/constant/appRoutes.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/data/datasource/remote/OffersData/OffersData.dart';
import 'package:e_commerce_app/data/model/ItemsModel.dart';
import 'package:get/get.dart';

abstract class OffersController extends GetxController {
  getOffersData();
}

class OffersControllerImp extends OffersController {
  StatusRequest statusRequest = StatusRequest.none;
  Offersdata offersdata = Get.put(Offersdata(Get.find()));
  List<ItemsModel> itemsModelListdata = [];

  @override
  getOffersData() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await offersdata.getOffersData();

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List responsedata = response["data"];
        itemsModelListdata
            .addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        print("errro no data");
      }
    } else {
      print("server erro failed ");
    }

    update();
  }

  @override
  void onInit() {
    super.onInit();
    getOffersData();
  }

  goToItemsDetails(ItemsModel itemsModel) {
    Get.toNamed(appRoutes.itemsDetailsScreen, arguments: {
      "itemsModel": itemsModel,
    });
  }
}
