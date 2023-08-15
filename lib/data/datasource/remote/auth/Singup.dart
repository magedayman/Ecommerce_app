import 'package:e_commerce_app/core/classes/Curd.dart';
import 'package:e_commerce_app/core/constant/appLinkApi.dart';

class SingupData {
  Crud crud;

  SingupData(this.crud);

  postSingupData(
      String username, String email, String phone, String password) async {
    var response = await crud.PostData(AppLinkApi.linkApiSingup, {
      "username": username,
      "password": password,
      "phone": phone,
      "email": email,
    });

    return response.fold((l) => l, (r) => r);
  }
}
