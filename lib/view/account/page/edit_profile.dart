import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:siskangv2/core/controller/auth_controller.dart';
import 'package:siskangv2/themes/asset_dir.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/view/account/widget/profile_textfield.dart';
import 'package:siskangv2/view/misc/image_viewer.dart';
import 'package:siskangv2/widget/button_main.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Pallete.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () => Get.back(),
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
                                            tag: auth.userData!.id!,
                                            child: Image.network(
                                              auth.userPhoto(auth.userData!.photo!),
                                              fit: BoxFit.cover,
                                              alignment: Alignment.topCenter,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      child: GestureDetector(
                                        onTap: () => Get.to(() => ImageViewer(
                                            tag: auth.userData!.id!,
                                            image:
                                                NetworkImage(auth.userPhoto(auth.userData!.photo!)),
                                            newsTitle: auth.userData!.name!)),
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
                      ProfileTextfield(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        hintText: "Masukkan NIM",
                        enabled: false,
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        initialValue: "938993790",
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        title: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text("NIM",
                              style:
                                  Get.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w600)),
                        ),
                      ),
                      ProfileTextfield(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        hintText: "Masukkan Nama",
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        initialValue: "Nyen kaden",
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        title: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text("Nama",
                              style:
                                  Get.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w600)),
                        ),
                      ),
                      ProfileTextfield(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        hintText: "Masukkan Email",
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        initialValue: "Nyen kaden",
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        title: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text("Email",
                              style:
                                  Get.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w600)),
                        ),
                      ),
                      ProfileTextfield(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        hintText: "Masukkan Nomor Handphone",
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        initialValue: "Nyen kaden",
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.done,
                        title: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text("No. Hp",
                              style:
                                  Get.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w600)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          "Ganti Password",
                          style: Get.textTheme.headline5!.copyWith(fontWeight: FontWeight.bold),
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
                  child: ButtonMain(
                    height: 50,
                    width: Get.width,
                    text: "Update Profil",
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
