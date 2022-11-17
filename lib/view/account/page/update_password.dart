import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:siskangv2/themes/asset_dir.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/view/account/widget/profile_textfield.dart';
import 'package:siskangv2/widget/button_main.dart';

class UpdatePassword extends StatelessWidget {
  const UpdatePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Pallete.primaryLight,
          titleSpacing: 8,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Ganti Password",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Get.textTheme.headline4
                  ?.copyWith(color: Pallete.white, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Ganti Password",
                        style: Get.textTheme.headline5!
                            .copyWith(fontWeight: FontWeight.bold, color: Pallete.black),
                      ),
                    ),
                    ProfileTextfield(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintText: "Masukkan Password Lama",
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      obsecure: true,
                      title: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text("Password Lama",
                            style: Get.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w600)),
                      ),
                    ),
                    ProfileTextfield(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintText: "Masukkan Password Baru",
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      obsecure: true,
                      title: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text("Password Baru",
                            style: Get.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w600)),
                      ),
                    ),
                    ProfileTextfield(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintText: "Ketik Ulang Password Baru",
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      obsecure: true,
                      title: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text("Ketik Ulang Password Baru",
                            style: Get.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
                ),
              )),
              Container(
                width: Get.width,
                color: Pallete.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: ButtonMain(
                    height: 50,
                    width: Get.width,
                    text: "Ganti Password",
                    textColor: Pallete.white,
                    buttonColor: Pallete.primaryLight,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
