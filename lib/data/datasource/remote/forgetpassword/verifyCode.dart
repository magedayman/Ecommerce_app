import 'package:e_commerce_app/core/classes/Curd.dart';
import 'package:e_commerce_app/core/constant/appLinkApi.dart';

class VerifyCodepPwData {
  Crud crud;

  VerifyCodepPwData(this.crud);

  postverifycodeFPdata(String email, String verifycode) async {
    var response = await crud.PostData(AppLinkApi.linkApifpVerifyCode, {
      "email": email,
      "verifycode": verifycode,
    });

    return response.fold((l) => l, (r) => r);
  }
}
