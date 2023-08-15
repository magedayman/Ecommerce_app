import 'package:e_commerce_app/core/classes/Curd.dart';
import 'package:e_commerce_app/core/constant/appLinkApi.dart';

class TestData {
  Crud crud;

  TestData(this.crud);

//to get data from request crud postdata//
  getAlldata() async {
    var response = await crud.PostData(AppLinkApi.test, {});
    // to split the returns value to right  map and  left statusRequest
    return response.fold((l) => l, (r) => r);
  }
}
