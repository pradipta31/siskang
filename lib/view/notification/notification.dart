import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siskangv2/components/main_action_button.dart';
import 'package:siskangv2/core/common/links.dart';
import 'package:siskangv2/core/controller/notif_controller.dart';
import 'package:siskangv2/core/model/user_model.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/view/notification/widget/notification_card.dart';

class Notification extends StatelessWidget {
  const Notification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserModel data = Get.arguments;
    final _notifController = Get.find<NotifController>();

    _notifController.fetchAllNotif(idProdi: data.prodiId!, nim: data.nim!);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.primaryLight,
        titleSpacing: 8,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Notifikasi",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Get.textTheme.headline4
                ?.copyWith(color: Pallete.white, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: GetBuilder<NotifController>(
          init: Get.find<NotifController>(),
          builder: (controller) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: controller.notif.length,
              itemBuilder: (context, index) {
                log(controller.notif.length.toString());
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await _notifController
                            .updateReadNotification(
                                idPesan: controller.notif[index].id!, nim: data.nim!)
                            .then((value) {
                          if (!value) {
                            Get.snackbar("Kesalahan", "Gagal dalam memperbarui notifikasi");
                          } else {
                            controller.notif[index].isRead = true;
                            controller.update();
                            Get.defaultDialog(
                                title: controller.notif[index].title ?? "N/A",
                                middleText: controller.notif[index].message ?? "N/A",
                                middleTextStyle: Get.textTheme.bodyText1,
                                titleStyle: Get.textTheme.headline6!
                                    .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                                contentPadding: const EdgeInsets.all(8),
                                barrierDismissible: false,
                                confirm: MainActionButton(
                                  color: Pallete.primaryLight,
                                  height: 30,
                                  label: "OK",
                                  width: Get.width,
                                  onTap: () {
                                    Get.back();
                                  },
                                ));
                          }
                        });
                      },
                      child: NotificationCard(
                          title: controller.notif[index].title ?? "N/A",
                          message: controller.notif[index].message ?? "N/A",
                          isRead: controller.notif[index].isRead,
                          padding: 12,
                          date: stringToDate(date: controller.notif[index].date!)),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Divider(
                        thickness: 1,
                        color: Pallete.lightGrey,
                      ),
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    ));
  }
}
