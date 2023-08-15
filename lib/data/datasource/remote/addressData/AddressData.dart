import 'package:e_commerce_app/core/classes/Curd.dart';
import 'package:e_commerce_app/core/constant/appLinkApi.dart';

class AddressData {
  Crud crud;

  AddressData(this.crud);

  getAddAddressData(String userid, String name, String city, String street,
      String lat, String lang) async {
    var response = await crud.PostData(AppLinkApi.addAddresslink, {
      "usersid": userid,
      "addressname": name,
      "city": city,
      "street": street,
      "lat": lat,
      "lang": lang,
    });

    return response.fold((l) => l, (r) => r);
  }

  getDeleteAddressData(String addressId) async {
    var response = await crud.PostData(AppLinkApi.deleteAddresslink, {
      "addressid": addressId,
    });

    return response.fold((l) => l, (r) => r);
  }

  getUpdateAddressData(
      String name, String city, String street, String lat, String lang) async {
    var response = await crud.PostData(AppLinkApi.updateAddresslink, {
      "address_name": name,
      "address_city": city,
      "address_street": street,
      "address_lat": lat,
      "address_lang": lang,
    });

    return response.fold((l) => l, (r) => r);
  }

  getViewAddressData(String addressuserid) async {
    var response = await crud.PostData(AppLinkApi.viewAddresslink, {
      "addressuserid": addressuserid,
    });

    return response.fold((l) => l, (r) => r);
  }
}
