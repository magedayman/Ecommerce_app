import 'package:e_commerce_app/core/classes/Curd.dart';
import 'package:e_commerce_app/core/constant/appLinkApi.dart';

class FavoriteData {
  Crud crud;

  FavoriteData(this.crud);

  addfavoritedata(String userid, String itemsid) async {
    var response = await crud.PostData(AppLinkApi.addfavorite, {
      "userid": userid,
      "itemsid": itemsid,
    });

    return response.fold((l) => l, (r) => r);
  }

  removefavoritedata(String userid, String itemsid) async {
    var response = await crud.PostData(AppLinkApi.removefavorite, {
      "userid": userid,
      "itemsid": itemsid,
    });

    return response.fold((l) => l, (r) => r);
  }
}
