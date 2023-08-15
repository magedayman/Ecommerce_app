import 'package:e_commerce_app/core/classes/StatusRequest.dart';

handlingData(dynamic response) {
  if (response is StatusRequest) {
    return response; // it mean the response return with a falier ,,
  } else {
    return StatusRequest.success;
  }
}
