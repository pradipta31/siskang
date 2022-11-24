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

  Future<void> logout(FormData form) async {
    await post(getUriEndpoint(domain, "$staticPath/token_update").toString(), form)
        .catchError((e) => throw e);
  }

  Future<void> updateProfile(FormData form, String id) async {
    return await put(getUriEndpoint(domain, "/api/profile/$id").toString(), form).then((value) {
      if (!responseChecker(value)) {
        throw "Error update profile ${value.body}";
      }
    });
  }

  Future<void> settingProfileAddDB(FormData form) async {
    return await post(getUriEndpoint(domain, "$staticPath/settingProfileAddDB").toString(), form)
        .then((value) {
      if (!responseChecker(value)) {
        throw "Error settingProfileAddDB ${value.body}";
      }
    });
  }
}
