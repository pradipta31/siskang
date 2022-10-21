import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:siskangv2/core/common/bindings.dart';
import 'package:siskangv2/core/common/pages.dart';
import 'package:siskangv2/themes/themes.dart';

void main() async {
  await GetStorage.init();
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
