import 'dart:convert';

import 'package:get/get.dart';
import 'package:siskangv2/core/common/links.dart';
import 'package:siskangv2/core/model/schedule_model.dart';

class ScheduleService extends GetConnect {
  Future<List<ScheduleModel>> getSchedule(FormData form) async {
    return await post(getUriEndpoint(domain, "$staticPath/getJadwal").toString(), form)
        .then((value) {
      if (responseChecker(value)) {
        return List<ScheduleModel>.from(
            jsonDecode(value.body).map((e) => ScheduleModel.fromJson(e)));
      } else {
        throw "Error getSchedule ${value.body}";
      }
    }).catchError((e) => throw e);
  }
}
