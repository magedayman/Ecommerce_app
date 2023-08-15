import 'package:e_commerce_app/core/classes/Curd.dart';
import 'package:e_commerce_app/core/constant/appLinkApi.dart';

class OrdersData {
  Crud crud;

  OrdersData(this.crud);

  getCheckoutData(
    String userid,
    String address,
    String orderstype,
    String pricedelivery,
    String ordersprice,
    String orderscoupon,
    String paymentmethod,
    String coupondiscount,
  ) async {
    var response = await crud.PostData(AppLinkApi.checkoutlink, {
      "usersid": userid,
      "address": address,
      "orderstype": orderstype,
      "pricedilivery": pricedelivery,
      "ordersprice": ordersprice,
      "orderscoupon": orderscoupon,
      "paymentmethod": paymentmethod,
      "coupondiscount": coupondiscount,
    });

    return response.fold((l) => l, (r) => r);
  }

  getPendingOrdersData(String usersid) async {
    var response = await crud.PostData(AppLinkApi.pendingOrderslink, {
      "usersid": usersid,
    });

    return response.fold((l) => l, (r) => r);
  }

  getOrderDetailsData(String ordersId) async {
    var response = await crud.PostData(AppLinkApi.orderDetailsLink, {
      "ordersid": ordersId,
    });

    return response.fold((l) => l, (r) => r);
  }

  getOrderDeleteData(String orderid) async {
    var response = await crud.PostData(AppLinkApi.deleteOrderLink, {
      "orderid": orderid,
    });

    return response.fold((l) => l, (r) => r);
  }

  getArchiveOrdersData(String usersid) async {
    var response = await crud.PostData(AppLinkApi.orderArchiveLink, {
      "usersid": usersid,
    });

    return response.fold((l) => l, (r) => r);
  }

  getRatingdata(String ordersid, String rating, String ratingcomment) async {
    var response = await crud.PostData(AppLinkApi.ratingLink, {
      "ordersid": ordersid,
      "rating": rating,
      "ratingcomment": ratingcomment,
    });

    return response.fold((l) => l, (r) => r);
  }
}
