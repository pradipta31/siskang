import 'package:get/get.dart';
import 'package:siskangv2/core/controller/auth_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
