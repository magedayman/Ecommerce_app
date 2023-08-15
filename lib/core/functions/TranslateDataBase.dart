import 'package:e_commerce_app/core/services/services.dart';
import 'package:get/get.dart';

appServices serivice = Get.find();
translateDatabase(columnAr, columnEn) {
  if (serivice.sharedpreferance.getString("lang") == "ar") {
    return columnAr;
  } else {
    return columnEn;
  }
}
