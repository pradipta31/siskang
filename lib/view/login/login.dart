import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siskangv2/components/main_action_button.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/view/dashboard/main_dashboard.dart';
import 'package:siskangv2/view/dashboard/page/dashboard.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Image.asset('asset/images/logo.png'),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Username',
                              hintText: 'Masukkan NIM')),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: 'Masukkan Password '),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: MainActionButton(
                        height: 50,
                        width: Get.width,
                        label: "Login",
                        onTap: () => Get.off(() => const MainDashboard()),
                        borderRadius: 8,
                      ),
                    ),
                    // RichText(
                    //   text: TextSpan(
                    //     children: [
                    //       TextSpan(text: "Belum memiliki akun? ", style: Get.textTheme.bodyText1),
                    //       TextSpan(
                    //         text: "Register",
                    //         recognizer: TapGestureRecognizer()..onTap = () => log("DATA"),
                    //         style: Get.textTheme.bodyText1?.copyWith(
                    //             color: Pallete.buttonMainColor, fontWeight: FontWeight.bold),
                    //       )
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
