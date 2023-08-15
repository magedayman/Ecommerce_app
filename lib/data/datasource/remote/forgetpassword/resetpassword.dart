import 'package:e_commerce_app/core/classes/Curd.dart';
import 'package:e_commerce_app/core/constant/appLinkApi.dart';

class ResetpasswordData {
  Crud crud;

  ResetpasswordData(this.crud);

  postResetpasswordData(String email, String password) async {
    var response = await crud.PostData(AppLinkApi.linkApifpResetpassword, {
      "email": email,
      "password": password,
    });

    return response.fold((l) => l, (r) => r);
  }
}
