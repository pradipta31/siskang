import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:siskangv2/core/common/links.dart';
import 'package:siskangv2/core/model/user_model.dart';
import 'package:siskangv2/core/service/auth_service.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  String? username;
  String? password;
  UserModel? userData;
  UserModel? tempUserData;
  GetStorage authPref = GetStorage("auth");

  Future<void> login() async {
    await AuthService().login(FormData({"username": username, "password": password})).then((value) {
      userData = value;
      value.toJson().forEach((key, value) {
        authPref.write(key, value.toString());
      });
      update();
    }).catchError((error) {
      throw error;
    });
  }

  Future<void> changePassword(String oldPass, String newPass, String? reNewPass) async {
    if (newPass == reNewPass) {
      await AuthService()
          .login(FormData({"username": username, "password": oldPass}))
          .then((value) {
        if (value.id != null || !value.id!.isBlank!) {
          settingProfileAddDB(newPass);
        } else {
          throw "Password lama tidak sesuai";
        }
      }).catchError((e) => throw e.toString());
    } else {
      throw "Password baru tidak sesuai";
    }
  }

  Future<void> logout({required String jabatan, required String nim, required String token}) async {
    await AuthService()
        .logout(FormData({"jabatan": jabatan, "nim": nim, "token": token}))
        .then((value) {
      authPref.erase();
    }).catchError((e) {
      log("Error logout $e");
    });
  }

  Future<void> checkLogin() async {
    if (authPref.hasData("Id")) {
      log("${authPref.read("Username")}, ${authPref.read("Passwordplain")}");
      username = authPref.read("Username");
      password = authPref.read("Passwordplain");
      await login();
    }
  }

  Future<String> uploadImage(XFile image) async {
    var stream = Stream.value(List<int>.from(await image.readAsBytes()));
    var length = await image.length();
    var request = http.MultipartRequest("POST", getUriEndpoint(domain, "$staticPath/upload_foto"));
    request.files.add(http.MultipartFile('file', stream, length, filename: basename(image.path)));
    return await request.send().then((value) async {
      return basename(image.path);
    }).catchError((e) {
      log(e.toString(), name: "Upload Image");
    });
  }

  Future<void> updateProfile() async {
    return await AuthService()
        .updateProfile(FormData(tempUserData!.toJson()), tempUserData!.id!)
        .catchError((e) {
      log("Error update profile $e");
    });
  }

  Future<void> settingProfileAddDB([String? password]) async {
    return await AuthService()
        .settingProfileAddDB(FormData({
      "jabatan": tempUserData!.jabatan,
      "nim": tempUserData!.nim,
      "password": password,
      "no_telp": tempUserData!.phoneNum,
      "foto": tempUserData!.photo
    }))
        .catchError((e) {
      log("$e");
    });
  }

  Future manipulateDoingUpdate() async {
    if (tempUserData?.tempImage != null) {
      await uploadImage(tempUserData!.tempImage!).then((value) {
        tempUserData!.photo = value;
      }).catchError((e) {
        log("Failed add photo $e");
      });
    }
    await settingProfileAddDB();
    userData = tempUserData;
  }

  String userPhoto(String photoName) => "https://siska-ng.site/assets/images/$photoName";
}
