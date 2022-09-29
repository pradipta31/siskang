import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siskangv2/components/main_action_button.dart';
import 'package:siskangv2/core/controller/auth_controller.dart';
import 'package:siskangv2/view/dashboard/main_dashboard.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formLogin = GlobalKey<FormState>();
  LoginPage({Key? key}) : super(key: key);

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
              const SizedBox(
                height: 16,
              ),
              GetBuilder<AuthController>(
                  init: Get.find<AuthController>(),
                  builder: (auth) {
                    return Expanded(
                        flex: 3,
                        child: Form(
                          key: _formLogin,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Username',
                                      hintText: 'Masukkan NIM'),
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  style: Get.textTheme.bodyText1,
                                  cursorWidth: 2.0,
                                  cursorColor: Get.theme.primaryColor,
                                  keyboardType: TextInputType.text,
                                  maxLines: 1,
                                  initialValue: auth.username,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value == null || value.isBlank!) {
                                      return "Username tidak boleh kosong";
                                    }
                                    return null;
                                  },
                                  onSaved: (newValue) {
                                    auth.username = newValue;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Password',
                                      hintText: 'Masukkan Password '),
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  style: Get.textTheme.bodyText1,
                                  cursorWidth: 2.0,
                                  cursorColor: Get.theme.primaryColor,
                                  keyboardType: TextInputType.text,
                                  maxLines: 1,
                                  obscureText: true,
                                  initialValue: auth.username,
                                  textInputAction: TextInputAction.done,
                                  validator: (value) {
                                    if (value == null || value.isBlank!) {
                                      return "Masukkan Password yang benar!";
                                    }
                                    return null;
                                  },
                                  onSaved: (newValue) {
                                    auth.password = newValue;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: MainActionButton(
                                  height: 50,
                                  width: Get.width,
                                  label: "Login",
                                  onTap: () {
                                    if (_formLogin.currentState!.validate()) {
                                      _formLogin.currentState!.save();
                                      FocusManager.instance.primaryFocus?.unfocus();
                                      auth
                                          .login()
                                          .then((value) => Get.offNamed('/dashboard'))
                                          .catchError((error) {
                                        Get.snackbar("Akses Ditolak",
                                            "Username atau password yang dimasukkan salah");
                                        log(error.toString());
                                      });
                                    }
                                  },
                                  // onTap: () => Get.off(() => const MainDashboard()),
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
                        ));
                  }),
            ]),
          ),
        ),
      ),
    );
  }
}
