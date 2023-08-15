import 'package:e_commerce_app/core/classes/StatusRequest.dart';
import 'package:e_commerce_app/core/functions/handling_data.dart';
import 'package:e_commerce_app/data/datasource/remote/test_data.dart';
import 'package:get/get.dart';

abstract class TestController extends GetxController {
  getdata();
}

class TestControllerImp extends TestController {
  TestData testData = TestData(Get.find());
  late StatusRequest statusRequest;
  List data = [];

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;

    var response = await testData.getAlldata();
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        data.addAll(response["data"]);
      } else {
        statusRequest = StatusRequest.noData;
      }
    }

    update();
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}
