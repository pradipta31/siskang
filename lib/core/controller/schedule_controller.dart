import 'dart:developer';

import 'package:get/get.dart';
import 'package:siskangv2/core/model/schedule_model.dart';
import 'package:siskangv2/core/service/schedule_service.dart';

class ScheduleController extends GetxController {
  List<ScheduleModel> schedule = [];

  void getSchedule({required String nim, required String idProdi}) async {
    await ScheduleService().getSchedule(FormData({'nim': nim, 'id_prodi': idProdi})).then((value) {
      schedule.assignAll(value.where((e) => e.nim == nim));
      update();
    }).catchError((e) {
      log(e.toString());
    });
  }
}
