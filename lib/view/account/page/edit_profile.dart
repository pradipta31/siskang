import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:siskangv2/components/image_picker_popup.dart';
import 'package:siskangv2/core/controller/auth_controller.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/view/account/page/update_password.dart';
import 'package:siskangv2/view/account/widget/profile_textfield.dart';
import 'package:siskangv2/widget/button_main.dart';

class EditProfile extends StatefulWidget {
  final AuthController _auth = Get.find<AuthController>();
  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _formKeyOne = GlobalKey<FormState>();

  @override
  void initState() {
    widget._auth.tempUserData = widget._auth.userData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Pallete.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () => Get.back(result: false),
              icon: const Icon(
                Icons.arrow_back,
                color: Pallete.black,
                size: 24,
              )),
          centerTitle: true,
          title: Text(
            "Profil",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Get.textTheme.headline4
                ?.copyWith(color: Pallete.black, fontWeight: FontWeight.w700),
          ),
        ),
        body: Container(
          color: Pallete.white,
          height: Get.height,
          width: Get.width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width,
                        height: Get.height / 4,
                        child: Center(
                          child: GetBuilder<AuthController>(
                              init: Get.find<AuthController>(),
                              builder: (auth) {
                                return Stack(
                                  children: [
                                    Container(
                                      width: 150,
                                      height: 150,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Pallete.white, width: 8),
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Pallete.darkGrey.withOpacity(0.16),
                                                blurRadius: 6,
                                                offset: const Offset(0, 3),
                                                spreadRadius: 4)
                                          ]),
                                      child: ClipOval(
                                        child: SizedBox.fromSize(
                                          size: const Size.fromRadius(50),
                                          child: Hero(
                                            tag: auth.tempUserData!.id!,
                                            child: auth.tempUserData!.tempImage != null
                                                ? Image.file(
                                                    File(auth.tempUserData!.tempImage!.path),
                                                    fit: BoxFit.cover,
                                                    alignment: Alignment.topCenter,
                                                  )
                                                : Image.network(
                                                    auth.userPhoto(auth.tempUserData!.photo!),
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context, error, stackTrace) =>
                                                        Image.asset(
                                                            "/asset/images/logo_undiksha.png"),
                                                    alignment: Alignment.topCenter,
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      child: GestureDetector(
                                        onTap: () async {
                                          await Get.dialog(
                                                  ImagePickerPopUp(
                                                      width: Get.width * 0.8,
                                                      children: _imagePickerList(),
                                                      title: Text(
                                                        "Ambil gambar menggunakan",
                                                        style: Get.textTheme.headline5!
                                                            .copyWith(color: Pallete.black),
                                                      )),
                                                  useSafeArea: true)
                                              .then((value) async {
                                            if (value != null) {
                                              _imagePickerCommand(value);
                                            }
                                          });
                                        },
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Pallete.white, width: 4),
                                              shape: BoxShape.circle,
                                              color: Colors.blue,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Pallete.darkGrey.withOpacity(0.16),
                                                    blurRadius: 6,
                                                    offset: const Offset(0, 3),
                                                    spreadRadius: 4)
                                              ]),
                                          child: ClipOval(
                                            child: SizedBox.fromSize(
                                                size: const Size.fromRadius(40),
                                                child: const Icon(
                                                  Icons.camera_alt,
                                                  color: Pallete.white,
                                                  size: 24,
                                                )),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          "Profile",
                          style: Get.textTheme.headline5!.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Form(
                        key: _formKeyOne,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProfileTextfield(
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              hintText: "Masukkan NIM",
                              enabled: false,
                              border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8))),
                              initialValue: widget._auth.tempUserData?.nim,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              title: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Text("NIM",
                                    style: Get.textTheme.bodyText1!
                                        .copyWith(fontWeight: FontWeight.w600)),
                              ),
                            ),
                            ProfileTextfield(
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              hintText: "Masukkan Nama",
                              border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8))),
                              initialValue: widget._auth.tempUserData?.name,
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              onSaved: (p0) {
                                widget._auth.tempUserData!.name = p0.toString();
                              },
                              title: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Text("Nama",
                                    style: Get.textTheme.bodyText1!
                                        .copyWith(fontWeight: FontWeight.w600)),
                              ),
                            ),
                            ProfileTextfield(
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              hintText: "Masukkan Email",
                              border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8))),
                              initialValue: widget._auth.tempUserData?.email,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              onSaved: (p0) {
                                widget._auth.tempUserData!.email = p0.toString();
                              },
                              title: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Text("Email",
                                    style: Get.textTheme.bodyText1!
                                        .copyWith(fontWeight: FontWeight.w600)),
                              ),
                            ),
                            ProfileTextfield(
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              hintText: "Masukkan Nomor Handphone",
                              border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8))),
                              initialValue: widget._auth.tempUserData?.phoneNum,
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.done,
                              onSaved: (value) {
                                widget._auth.tempUserData?.phoneNum = value.toString();
                              },
                              title: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Text("No. Hp",
                                    style: Get.textTheme.bodyText1!
                                        .copyWith(fontWeight: FontWeight.w600)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 24, 0, 8),
                              child: GestureDetector(
                                onTap: () async {
                                  return await Get.to(() => UpdatePassword())?.then((value) {
                                    if (value != null) {
                                      if (value) {
                                        Get.rawSnackbar(
                                            padding: const EdgeInsets.all(16),
                                            borderRadius: 8,
                                            margin: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                                            backgroundColor: Pallete.primaryLight,
                                            boxShadows: [
                                              const BoxShadow(
                                                  color: Pallete.darkGrey,
                                                  blurRadius: 2,
                                                  blurStyle: BlurStyle.outer)
                                            ],
                                            snackPosition: SnackPosition.TOP,
                                            messageText: Text(
                                              "Password Berhasil Diubah",
                                              style: Get.textTheme.headline6!.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Pallete.white),
                                            ));
                                      }
                                    }
                                  });
                                },
                                child: Container(
                                  width: Get.width,
                                  color: Pallete.white,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                                    child: ButtonMain(
                                      height: 50,
                                      width: Get.width,
                                      text: "Ganti Password",
                                      textColor: Pallete.white,
                                      buttonColor: Pallete.primaryLight,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
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
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            "Ubah Profil",
                            style: Get.textTheme.headline6!
                                .copyWith(fontWeight: FontWeight.bold, color: Pallete.black),
                          ),
                          content: Text(
                            "Apakah anda yakin untuk mengubah profil anda?",
                            style: Get.textTheme.bodyMedium!.copyWith(color: Pallete.black),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () async {
                                  Get.back();
                                  _savedUpdate();
                                },
                                child: Text("Ya",
                                    style:
                                        Get.textTheme.bodyMedium!.copyWith(color: Pallete.black))),
                            TextButton(
                                onPressed: () async {
                                  Get.back();
                                },
                                child: Text("Tidak",
                                    style:
                                        Get.textTheme.bodyMedium!.copyWith(color: Pallete.black)))
                          ],
                        ),
                      );
                    },
                    child: ButtonMain(
                      height: 50,
                      width: Get.width,
                      text: "Update Profil",
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

  _savedUpdate() async {
    if (_formKeyOne.currentState!.validate()) {
      // save
      _formKeyOne.currentState!.save();
      await widget._auth.manipulateDoingUpdate().then((value) {
        widget._auth.tempUserData = null;
        Get.back(result: true);
      });
    }
  }

  List<Widget> _imagePickerList() {
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Get.back(result: 0);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(
                  Icons.camera_alt_rounded,
                  size: 21,
                  color: Pallete.primaryLight,
                ),
              ),
              Text(
                "Kamera",
                style: Get.textTheme.headline5,
              )
            ],
          ),
        ),
      ),
      const Divider(thickness: 1, color: Pallete.darkGrey),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Get.back(result: 1);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(
                  Icons.photo_library_rounded,
                  size: 21,
                  color: Pallete.primaryLight,
                ),
              ),
              Text(
                "Galeri",
                style: Get.textTheme.headline5,
              )
            ],
          ),
        ),
      ),
    ];
  }

  void _imagePickerCommand(int value) async {
    if (value == 0) {
      await ImagePicker()
          .pickImage(source: ImageSource.camera, maxHeight: 600, maxWidth: 600, imageQuality: 75)
          .then((value) {
        setState(() {
          widget._auth.tempUserData!.tempImage = value;
          widget._auth.update();
        });
      });
    } else {
      await ImagePicker()
          .pickImage(source: ImageSource.gallery, maxHeight: 600, maxWidth: 600, imageQuality: 75)
          .then((value) {
        setState(() {
          widget._auth.tempUserData!.tempImage = value;
          widget._auth.update();
        });
      });
    }
  }

  @override
  void dispose() {
    widget._auth.tempUserData = null;
    super.dispose();
  }
}
