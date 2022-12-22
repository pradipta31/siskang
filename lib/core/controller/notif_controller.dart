import 'dart:developer';

import 'package:get/get.dart';
import 'package:siskangv2/core/model/notif_model.dart';
import 'package:siskangv2/core/service/notification_service.dart';

class NotifController extends GetxController {
  List<NotifModel> notif = [];
  final NotificationService _notificationService = NotificationService();

  Future<int> getCountNotification({required String nim}) async {
    log(nim);
    return await _notificationService.getNotifUnread(nim).catchError((e) {
      log(e);
      return 0;
    });
  }

  void fetchAllNotif({required String idProdi, required String nim}) {
    _notificationService.getNotif(FormData({'id_prodi': idProdi, 'nim': nim})).then((value) {
      notif.assignAll(value);
      update();
      log(notif.toString());
    }).catchError((e) {
      log(e.toString());
    });
  }

  Future<bool> updateReadNotification({required String idPesan, required String nim}) async {
    return await _notificationService
        .updateRead(FormData({'nim': nim, 'id_pesan': idPesan}))
        .then((value) {
      return value;
    });
  }
}
