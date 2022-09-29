import 'dart:convert';

import 'package:get/get.dart';
import 'package:siskangv2/core/common/links.dart';
import 'package:siskangv2/core/model/user_model.dart';

class AuthService extends GetConnect {
  Future<UserModel> login(FormData form) async {
    return await post(getUriEndpoint(domain, "$staticPath/login").toString(), form).then((value) {
      if (responseChecker(value)) {
        return UserModel.fromJson(jsonDecode(value.body));
      } else {
        throw "Error login ${value.body}";
      }
    });
  }
}