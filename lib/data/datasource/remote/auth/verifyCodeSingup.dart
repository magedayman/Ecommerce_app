import 'package:e_commerce_app/core/classes/Curd.dart';
import 'package:e_commerce_app/core/constant/appLinkApi.dart';

class VerifyCodeSingupData {
  Crud crud;

  VerifyCodeSingupData(this.crud);

  postVCodesingupData(String email, String verifyCode) async {
    var response = await crud.PostData(AppLinkApi.linkApiSingupVerifyCode, {
      "email": email,
      "verifycode": verifyCode,
    });

    return response.fold((l) => l, (r) => r);
  }

  reSendVerifyCodedata(String email) async {
    var response = await crud.PostData(
        AppLinkApi.linkResendSingupVerifyCode, {"email": email});

    return response.fold((l) => l, (r) => r);
  }
}
