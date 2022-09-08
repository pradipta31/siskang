import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siskangv2/components/main_action_button.dart';
import 'package:siskangv2/login.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/widget/button_main.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            width: Get.width,
            height: Get.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Color.fromARGB(255, 82, 182, 223),
                  Color.fromARGB(255, 65, 120, 212)
                ])),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: Center(
                          child: Image.asset(
                        'asset/images/logo.png',
                        fit: BoxFit.fill,
                      ))),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(padding: EdgeInsets.all(10.0)),
                            Center(
                              child: Text(
                                'Selamat Datang di\nSIsKA-NG',
                                style: Get.textTheme.headline2!
                                    .copyWith(color: Pallete.white, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const Padding(padding: EdgeInsets.all(10.0)),
                            Text(
                              'Sistem Informasi Akademik (SIsKA) adalah sistem informasi yang ada pada Program Studi Ilmu Komputer Pascasarjana Universitas Pendidikan Ganesha (UNDIKSHA) prodi Ilmu Komputer. Sistem ini digunakan untuk membantu pengelolaan data penelitian mahasiswa pada Prodi ILKOM.',
                              style: Get.textTheme.bodyText1?.copyWith(color: Pallete.white),
                              textAlign: TextAlign.center,
                            ),
                            const Padding(padding: EdgeInsets.all(20.0)),
                            Center(
                              child: MainActionButton(
                                height: 60,
                                label: "Lanjut",
                                borderRadius: 14,
                                width: Get.width / 2,
                                textColor: Pallete.white,
                                onTap: () {
                                  Get.off(() => LoginPage(), transition: Transition.rightToLeft);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
