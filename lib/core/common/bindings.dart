import 'package:get/get.dart';
import 'package:siskangv2/core/controller/auth_controller.dart';
import 'package:siskangv2/core/controller/research_controller.dart';
import 'package:siskangv2/core/controller/schedule_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.lazyPut(() => ResearchController());
    Get.lazyPut(() => ScheduleController());
  }
}
