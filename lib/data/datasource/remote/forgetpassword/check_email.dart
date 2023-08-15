import 'package:e_commerce_app/core/classes/Curd.dart';
import 'package:e_commerce_app/core/constant/appLinkApi.dart';

class CheckEmailData {
  Crud crud;

  CheckEmailData(this.crud);

  postCheckEmailData(String email) async {
    var response = await crud.PostData(AppLinkApi.linkApifpCheckEmail, {
      "email": email,
    });

    return response.fold((l) => l, (r) => r);
  }
}
