import 'package:e_commerce_app/core/classes/Curd.dart';
import 'package:e_commerce_app/core/constant/appLinkApi.dart';

class LoginData {
  Crud crud;

  LoginData(this.crud);

  postLoginData(String email, String password) async {
    var response = await crud.PostData(AppLinkApi.linkApiLogin, {
      "email": email,
      "password": password,
    });

    return response.fold((l) => l, (r) => r);
  }
}
