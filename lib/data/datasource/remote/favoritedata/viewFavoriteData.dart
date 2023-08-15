import 'package:e_commerce_app/core/classes/Curd.dart';
import 'package:e_commerce_app/core/constant/appLinkApi.dart';

class Viewfavorite {
  Crud crud;

  Viewfavorite(this.crud);

  getFavoriteData(String userid) async {
    var response = await crud.PostData(AppLinkApi.viewfavorite, {
      "userid": userid,
    });

    return response.fold((l) => l, (r) => r);
  }

  removeFavoriteData(String favoriteid) async {
    var response = await crud.PostData(AppLinkApi.deletefromfavorite, {
      "favoriteid": favoriteid,
    });

    return response.fold((l) => l, (r) => r);
  }
}
