import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:siskangv2/core/common/links.dart';
import 'package:siskangv2/core/model/user_model.dart';
import 'dart:developer';

class AuthService extends GetConnect {
  Future<UserModel> login(FormData form) async {
    return await post(getUriEndpoint(domain, "$staticPath/login").toString(), form)
        .then((value) async {
      if (responseChecker(value)) {
        var data = UserModel.fromJson(jsonDecode(value.body));
        return await updateToken(data.jabatan!, data.nim!)
            .then((value) => data)
            .catchError((e) => throw e);
      } else {
        throw "Error login ${value.body}";
      }
    });
  }

  Future<bool> updateToken(String jabatan, String nim) async {
    return await FirebaseMessaging.instance.getToken().then((token) async {
      if (token != null) {
        log(token, name: "Token");
        await FirebaseMessaging.instance.subscribeToTopic("mahasiswa");
        return await post(getUriEndpoint(domain, "$staticPath/token_update").toString(),
            FormData({'jabatan': jabatan, 'nim': nim, 'token': token})).then((value) {
          if (responseChecker(value)) {
            return true;
          } else {
            throw "Error updateToken ${value.body} ${value.statusText} ${value.statusCode}";
          }
        });
      } else {
        throw "Error updateToken from FCM cause by null";
      }
    }).catchError((e) => throw e);
  }

  Future<Map<String, dynamic>> checkPass(FormData form) async {
    return await post(getUriEndpoint(domain, "$staticPath/login").toString(), form).then((value) {
      return {"code": value.statusCode, "status": value.statusText};
    });
  }

  Future<void> logout(FormData form) async {
    await post(getUriEndpoint(domain, "$staticPath/token_update").toString(), form)
        .then((value) async {
      await FirebaseMessaging.instance.unsubscribeFromTopic("mahasiswa");
      await FirebaseMessaging.instance.deleteToken();
    }).catchError((e) => throw e);
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
