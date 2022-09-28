import 'package:get/get.dart';
import 'package:siskangv2/core/model/user_model.dart';
import 'package:siskangv2/core/service/auth_service.dart';

class AuthController extends GetxController {
  String? username;
  String? password;
  UserModel? userData;

  Future<void> login() async {
    await AuthService().login(FormData({"username": username, "password": password})).then((value) {
      userData = value;
    }).catchError((error) {
      throw error;
    });
  }
}
