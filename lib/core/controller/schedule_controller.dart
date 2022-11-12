import 'dart:developer';

import 'package:get/get.dart';
import 'package:siskangv2/core/model/schedule_model.dart';
import 'package:siskangv2/core/service/schedule_service.dart';

class ScheduleController extends GetxController {
  List<ScheduleModel> schedule = [];

  void getSchedule({required String nim, required String idProdi}) async {
    await ScheduleService().getSchedule(FormData({'nim': nim, 'id_prodi': idProdi})).then((value) {
      schedule.assignAll(value);
      update();
    }).catchError((e) {
      log(e.toString());
    });
  }

  int lengthOfSearchedList(String? search) {
    if (search != null && search.isNotEmpty) {
      if (!search.isBlank!) {
        return schedule
            .where((e) {
              if (e.judul?.toUpperCase().contains(search.toUpperCase()) ?? false) {
                return true;
              } else if (e.nama?.toUpperCase().contains(search.toUpperCase()) ?? false) {
                return true;
              } else {
                return false;
              }
            })
            .toList()
            .length;
      }
    }
    return schedule.length;
  }

  List<ScheduleModel> scheduleData(String? search) {
    if (search != null && search.isNotEmpty) {
      if (!search.isBlank!) {
        return schedule.where((e) {
          if (e.judul?.toUpperCase().contains(search.toUpperCase()) ?? false) {
            return true;
          } else if (e.nama?.toUpperCase().contains(search.toUpperCase()) ?? false) {
            return true;
          } else {
            return false;
          }
        }).toList();
      }
    }
    return schedule;
  }
}
