import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:siskangv2/core/common/bindings.dart';
import 'package:siskangv2/core/common/pages.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/themes/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    log("Firebase onMessage.listen ${message.notification}");
    Get.rawSnackbar(
        padding: const EdgeInsets.all(16),
        borderRadius: 8,
        margin: const EdgeInsets.fromLTRB(8, 0, 8, 16),
        backgroundColor: Pallete.primaryLight,
        boxShadows: [
          const BoxShadow(color: Pallete.darkGrey, blurRadius: 2, blurStyle: BlurStyle.outer)
        ],
        titleText: Text(
          message.notification?.title ?? "No Title",
          style:
              Get.textTheme.headline6!.copyWith(fontWeight: FontWeight.bold, color: Pallete.white),
        ),
        isDismissible: false,
        dismissDirection: DismissDirection.horizontal,
        snackPosition: SnackPosition.TOP,
        messageText: Text(
          message.notification?.body ?? "",
          style: Get.textTheme.headline6!
              .copyWith(fontWeight: FontWeight.normal, color: Pallete.white),
        ));
    // Get.snackbar(message.notification?.title ?? "No Title", message.notification?.body ?? "");
    // print('Got a message whilst in the foreground!');
    // print('Message data: ${message.data}');

    // if (message.notification != null) {
    //   print('Message also contained a notification: ${message.notification}');
    // }
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.lightTheme(context),
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
      initialRoute: '/',
      getPages: Pages.pages,
    );
  }
}
