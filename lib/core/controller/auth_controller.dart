import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:siskangv2/core/model/user_model.dart';
import 'package:siskangv2/core/service/auth_service.dart';

class AuthController extends GetxController {
  String? username;
  String? password;
  UserModel? userData;
  GetStorage authPref = GetStorage("auth");

  Future<void> login() async {
    await AuthService().login(FormData({"username": username, "password": password})).then((value) {
      userData = value;
      value.toJson().forEach((key, value) {
        authPref.write(key, value);
      });
    }).catchError((error) {
      throw error;
    });
  }

  Future<void> checkLogin() async {
    if (authPref.hasData("Id")) {
      log("${authPref.read("Username")}, ${authPref.read("Passwordplain")}");
      username = authPref.read("Username");
      password = authPref.read("Passwordplain");
      await login();
      // log(authPref.getValues().toString());
      // userData = UserModel.fromJson(authPref.getValues());
    }
  }
}
