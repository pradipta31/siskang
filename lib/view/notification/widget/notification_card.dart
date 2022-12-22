import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siskangv2/core/common/links.dart';

import 'package:siskangv2/themes/color_pallete.dart';

class NotificationCard extends StatelessWidget {
  String title;
  String message;
  bool isRead;
  DateTime date;
  NotificationCard({
    Key? key,
    required this.title,
    required this.message,
    required this.isRead,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      color: Pallete.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Pallete.primaryLight,
            ),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.notifications,
                size: 48,
                color: Pallete.white,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Flexible(
              fit: FlexFit.tight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text(
                        title,
                        style: Get.textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      )),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        _getTimeOfBill(date: date),
                        style: Get.textTheme.headline6,
                      )
                    ],
                  ),
                  Text(
                    message,
                    style: Get.textTheme.bodyText1,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ))
        ],
      ),
    );
  }

  String _getTimeOfBill({required DateTime date}) {
    // var dateData = stringToDate(date: date);
    if (DateTime.now().toUtc().difference(date).inDays < 0) {
      return timeToString(
          time: stringToTime(time: dateToString(date: date, format: "hh:mm")),
          context: Get.context!);
    } else {
      return dateToString(date: date, format: "dd/MM/yyyy");
    }
  }
}
