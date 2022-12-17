import 'dart:convert';

import 'package:get/get.dart';
import 'package:siskangv2/core/common/links.dart';
import 'package:siskangv2/core/model/notif_model.dart';

class NotificationService extends GetConnect {
  Future<int> getNotifUnread(String nim) async {
    return await post(
            getUriEndpoint(domain, "$staticPath/login").toString(), FormData({"nim": nim}))
        .then((value) {
      if (responseChecker(value)) {
        return List<int>.from(jsonDecode(value.body).map((e) => e["jumlah"])).first;
      } else {
        throw "Error getNotifUnread ${value.body} ${value.statusCode}";
      }
    }).catchError((e) => throw e);
  }

  Future<List<NotifModel>> getNotif(FormData form) async {
    return await post(getUriEndpoint(domain, "$staticPath/login").toString(), form).then((value) {
      if (responseChecker(value)) {
        return List<NotifModel>.from(jsonDecode(value.body).map((e) => NotifModel.fromMap(e)));
      } else {
        throw "Error getNotif ${value.body} ${value.statusCode}";
      }
    }).catchError((e) => throw e);
  }
}
