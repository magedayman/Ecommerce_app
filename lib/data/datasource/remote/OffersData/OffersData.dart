import 'package:e_commerce_app/core/classes/Curd.dart';
import 'package:e_commerce_app/core/constant/appLinkApi.dart';

class Offersdata {
  Crud crud;

  Offersdata(this.crud);

  getOffersData() async {
    var response = await crud.PostData(AppLinkApi.offersLink, {});

    return response.fold((l) => l, (r) => r);
  }
}
