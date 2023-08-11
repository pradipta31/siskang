import 'dart:convert';

import 'package:get/get.dart';
import 'package:siskangv2/core/common/links.dart';
import 'package:siskangv2/core/model/notif_model.dart';

class NotificationService extends GetConnect {
  Future<int> getNotifUnread(String nim) async {
    return await post(getUriEndpoint(domain, "$staticPath/get_notif_penerima_unread").toString(),
        FormData({"nim": nim})).then((value) {
      if (responseChecker(value)) {
        return List<int>.from(jsonDecode(value.body).map((e) => int.parse(e["jumlah"]))).first;
      } else {
        throw "Error getNotifUnread ${value.body} ${value.statusCode}";
      }
    }).catchError((e) => throw e);
  }

  Future<List<NotifModel>> getNotif(FormData form) async {
    return await post(getUriEndpoint(domain, "$staticPath/get_notif_penerima").toString(), form)
        .then((value) {
      if (responseChecker(value)) {
        return List<NotifModel>.from(jsonDecode(value.body).map((e) => NotifModel.fromMap(e)));
      } else {
        throw "Error getNotif ${value.body} ${value.statusCode}";
      }
    }).catchError((e) => throw e);
  }

  Future<bool> updateRead(FormData form) async {
    return await post(getUriEndpoint(domain, "$staticPath/read_pesan").toString(), form)
        .then((value) {
      if (responseChecker(value)) {
        return true;
      }
      return false;
    }).catchError((e) => throw e);
  }
}
