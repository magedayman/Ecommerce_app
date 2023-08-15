import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/classes/StatusRequest.dart';
import 'package:e_commerce_app/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> PostData(String url, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(url), body: data);

        if (response.statusCode == 200 || response.statusCode == 201) {
          return Right(jsonDecode(response.body));
        } else {
          return const Left(StatusRequest.serverFaluier);
        }
      } else {
        return const Left(StatusRequest.offlineNetwork);
      }
    } on Exception catch (e) {
      print(e);
      return const Left(StatusRequest.serverFaluier);
    }
  }
}
