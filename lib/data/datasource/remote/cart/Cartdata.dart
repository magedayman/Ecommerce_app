import 'package:e_commerce_app/core/classes/Curd.dart';
import 'package:e_commerce_app/core/constant/appLinkApi.dart';

class CartData {
  Crud crud;

  CartData(this.crud);

  addCartData(String userid, String itemsid) async {
    var response = await crud.PostData(AppLinkApi.addCart, {
      "userid": userid,
      "itemsid": itemsid,
    });

    return response.fold((l) => l, (r) => r);
  }

  deleteCarttData(String userid, String itemsid) async {
    var response = await crud.PostData(AppLinkApi.deleteCart, {
      "userid": userid,
      "itemsid": itemsid,
    });

    return response.fold((l) => l, (r) => r);
  }

  itemsCountCartData(String userid, String itemsid) async {
    var response = await crud.PostData(AppLinkApi.itemsCountCart, {
      "usersid": userid,
      "itemsid": itemsid,
    });

    return response.fold((l) => l, (r) => r);
  }

  viewCartData(String userid) async {
    var response = await crud.PostData(AppLinkApi.viewCart, {
      "usersid": userid,
    });

    return response.fold((l) => l, (r) => r);
  }

  getCouponData(String couponName) async {
    var response = await crud.PostData(AppLinkApi.checkCoupon, {
      "couponName": couponName,
    });

    return response.fold((l) => l, (r) => r);
  }
}
