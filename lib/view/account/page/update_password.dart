import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siskangv2/core/controller/auth_controller.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/view/account/widget/profile_textfield.dart';
import 'package:siskangv2/widget/button_main.dart';

class UpdatePassword extends StatelessWidget {
  final GlobalKey<FormState> _formKeyOne = GlobalKey<FormState>();
  final AuthController _auth = Get.find<AuthController>();
  UpdatePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? oldPass, newPass, reNewPass;
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
                child: Form(
                  key: _formKeyOne,
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
                        onSaved: (value) {
                          oldPass = value;
                        },
                        title: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text("Password Lama",
                              style:
                                  Get.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w600)),
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
                        onSaved: (value) {
                          newPass = value;
                        },
                        title: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text("Password Baru",
                              style:
                                  Get.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w600)),
                        ),
                      ),
                      ProfileTextfield(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        hintText: "Ketik Ulang Password Baru",
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        onSaved: (value) {
                          reNewPass = value;
                        },
                        obsecure: true,
                        title: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text("Ketik Ulang Password Baru",
                              style:
                                  Get.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              Container(
                width: Get.width,
                color: Pallete.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: GestureDetector(
                    onTap: () async {
                      if (_formKeyOne.currentState!.validate()) {
                        _formKeyOne.currentState!.save();
                        if (oldPass == null) {
                          _errorSnackbar("Password tidak boleh kosong");
                        } else if (newPass == null) {
                          _errorSnackbar("Password baru tidak boleh kosong");
                        } else if (newPass!.length < 8) {
                          _errorSnackbar("Password tidak boleh kurang dari 8 karakter");
                        } else {
                          await _auth.changePassword(oldPass!, newPass!, reNewPass).catchError((e) {
                            Get.snackbar("", "");
                            _errorSnackbar(e.toString());
                          }).then((value) {
                            _auth.userData!.decryptPass = newPass!;
                            Get.back();
                          });
                        }
                      }
                    },
                    child: ButtonMain(
                      height: 50,
                      width: Get.width,
                      text: "Ganti Password",
                      textColor: Pallete.white,
                      buttonColor: Pallete.primaryLight,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  dynamic _errorSnackbar(String message) {
    return Get.rawSnackbar(
        padding: const EdgeInsets.all(16),
        borderRadius: 8,
        margin: const EdgeInsets.fromLTRB(8, 0, 8, 16),
        backgroundColor: Colors.red[700]!,
        boxShadows: [
          const BoxShadow(color: Pallete.darkGrey, blurRadius: 2, blurStyle: BlurStyle.outer)
        ],
        snackPosition: SnackPosition.BOTTOM,
        messageText: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: Get.textTheme.headline6!
                  .copyWith(fontWeight: FontWeight.bold, color: Pallete.white),
            )
          ],
        ));
  }
}
