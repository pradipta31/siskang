import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

const String domain = "siska-ng.site";
const String staticPath = "/Siska_api";
const String defaultDateFormat = "dd-MM-yyyy";
const String defaultStringDateFormat = "dd MMMM yyyy";
const String defaultTimeFormat = "HH:mm";

Uri getUriEndpoint(String authority, String unencodedPath, [Map<String, dynamic>? queryParam]) {
  return Uri.https(authority, unencodedPath, queryParam);
}

bool responseChecker(Response<dynamic> value) {
  if (value.isOk && value.body != null && value.body != "null") {
    return true;
  }
  return false;
}

DateTime stringToDate({required String date, String? format}) {
  return DateFormat(format ?? defaultDateFormat).parse(date);
}

String dateToString({required DateTime date, String? format}) {
  return DateFormat(format ?? defaultStringDateFormat).format(date);
}

TimeOfDay stringToTime({required String time, String? format}) {
  var timeFormat = DateFormat(format ?? defaultTimeFormat);
  return TimeOfDay.fromDateTime(timeFormat.parse(time));
}

String timeToString({required TimeOfDay time, bool isUse24 = true, required BuildContext context}) {
  return MaterialLocalizations.of(context).formatTimeOfDay(time, alwaysUse24HourFormat: isUse24);
}

String htmlParserToText(String text) {
  return text.replaceAll("(?s)<(\\w+)\\b[^<>]*>.*?</\\1>", "");
}

Widget snapshotChecker(AsyncSnapshot snapshot,
    {required Widget mainWidget, Widget? loadingWidget, Widget? failedWidget}) {
  if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
    return mainWidget;
  } else if (snapshot.connectionState == ConnectionState.waiting) {
    return loadingWidget ??
        const Center(
          child: CircularProgressIndicator(),
        );
  } else {
    return failedWidget ?? const SizedBox();
  }
}
