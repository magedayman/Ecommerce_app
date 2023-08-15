import 'package:get/get.dart';

validatInputField(String value, int min, int max, String type) {
  if (value.isEmpty) {
    return " $type Requierd. ";
  }

  if (type == "username" || type == "") {
    if (!GetUtils.isUsername(value)) {
      return "username is not valid";
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(value)) {
      return "Email is not valid";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(value)) {
      return "phone number is not valid";
    }
  }

  if (value.length < min) {
    return "letters musn't be less than $min";
  }
  if (value.length > max) {
    return "letters musn't be big than $max";
  }
}
