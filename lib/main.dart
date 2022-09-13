import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siskangv2/themes/themes.dart';
import 'package:siskangv2/view/landing_page/welcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.lightTheme(context),
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
