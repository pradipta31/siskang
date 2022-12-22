import 'package:get/get.dart';
import 'package:siskangv2/core/controller/auth_controller.dart';
import 'package:siskangv2/core/controller/news_controller.dart';
import 'package:siskangv2/core/controller/notif_controller.dart';
import 'package:siskangv2/core/controller/research_controller.dart';
import 'package:siskangv2/core/controller/schedule_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.lazyPut(() => ResearchController(), fenix: true);
    Get.lazyPut(() => ScheduleController(), fenix: true);
    Get.lazyPut(() => NewsController(), fenix: true);
    Get.lazyPut(() => NotifController(), fenix: true);
  }
}
