import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:siskangv2/core/controller/auth_controller.dart';
import 'package:siskangv2/core/controller/research_controller.dart';
import 'package:siskangv2/themes/asset_dir.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/view/account/page/edit_profile.dart';
import 'package:siskangv2/view/misc/image_viewer.dart';
import 'package:siskangv2/widget/status_badge.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> with SingleTickerProviderStateMixin {
  final _auth = Get.find<AuthController>();
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
            width: Get.width,
            height: Get.height,
            child: ListView(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      width: Get.width,
                      height: Get.height / 4,
                      color: Pallete.primaryLight,
                      margin: const EdgeInsets.only(bottom: 75),
                    ),
                    Positioned(
                      top: (Get.height / 4) - 75,
                      child: Container(
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
                        child: GetBuilder<AuthController>(
                            init: Get.find<AuthController>(),
                            builder: (auth) {
                              return GestureDetector(
                                onTap: () => Get.to(() => ImageViewer(
                                    tag: auth.userData!.id!,
                                    image: NetworkImage(auth.userPhoto(auth.userData!.photo!)),
                                    newsTitle: auth.userData!.name!)),
                                child: ClipOval(
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(48),
                                    child: Hero(
                                      tag: auth.userData!.id!,
                                      child: Image.network(
                                        //TODO: Ini URL nya ada yg ganti schemanya. Yg awalnya return nama image sekarang jadi return link image
                                        auth.userData!.photo!,
                                        // auth.userPhoto(auth.userData!.photo!),
                                        errorBuilder: (context, error, stackTrace) =>
                                            Image.asset("/asset/images/logo_undiksha.png"),
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topCenter,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GetBuilder<AuthController>(
                          init: Get.find<AuthController>(),
                          builder: (auth) {
                            return SizedBox(
                              width: Get.width,
                              child: Text(
                                auth.userData!.name!,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: Get.textTheme.headline5!
                                    .copyWith(fontWeight: FontWeight.bold, color: Pallete.black),
                              ),
                            );
                          }),
                      const SizedBox(
                        height: 4,
                      ),
                      GetBuilder<AuthController>(
                          init: Get.find<AuthController>(),
                          builder: (auth) {
                            return SizedBox(
                              width: Get.width,
                              child: Text(
                                auth.userData!.prodiName!,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: Get.textTheme.headline6!.copyWith(color: Pallete.darkGrey),
                              ),
                            );
                          }),
                      const SizedBox(
                        height: 4,
                      ),
                      GetBuilder<ResearchController>(
                          init: Get.find<ResearchController>(),
                          builder: (res) {
                            return StatusBadge(
                              width: Get.width / 3,
                              color: res.masaStudi!.status!.toLowerCase() == "in studi"
                                  ? Pallete.activeColor
                                  : const Color.fromARGB(255, 177, 18, 6),
                              text: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Text(
                                  res.masaStudi!.status!.toLowerCase() == "in studi"
                                      ? "Aktif"
                                      : "Tidak Aktif",
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: Get.textTheme.bodyText2
                                      ?.copyWith(color: Pallete.white, fontSize: 14),
                                ),
                              ),
                            );
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                      GetBuilder<ResearchController>(
                          init: Get.find<ResearchController>(),
                          builder: (res) {
                            return Container(
                              width: Get.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Pallete.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Pallete.darkGrey.withOpacity(0.3),
                                        blurRadius: 5,
                                        offset: const Offset(0, 3),
                                        spreadRadius: 2)
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 4),
                                        child: _masaStudiStats(
                                            title: "Awal Studi",
                                            detail: res.masaStudi!.startStudy!,
                                            color: Pallete.activeColor),
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 4),
                                        child: _masaStudiStats(
                                            title: "Sisa Masa Studi",
                                            detail: res.masaStudi!.remainingStudy!,
                                            color: Colors.yellow[700]!),
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 4),
                                        child: _masaStudiStats(
                                            title: "Akhir Studi",
                                            detail: res.masaStudi!.endStudy!,
                                            color: Colors.red[400]!),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Pallete.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Pallete.darkGrey.withOpacity(0.3),
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                  spreadRadius: 2)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _userMenu(
                                title: "Profile Setting",
                                icon: SvgPicture.asset(AssetsDirectory.user2,
                                    color: Pallete.primaryLight),
                                onTap: () async {
                                  await Get.to(() => EditProfile())?.then((value) {
                                    _auth.update();
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
                                              "Profile berhasil diubah",
                                              style: Get.textTheme.headline6!.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Pallete.white),
                                            ));
                                      }
                                    }
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              _userMenu(
                                title: "Logout",
                                icon: SvgPicture.asset(AssetsDirectory.exit,
                                    color: Pallete.primaryLight),
                                onTap: () async {
                                  await _auth
                                      .logout(
                                          jabatan: _auth.userData!.jabatan!,
                                          nim: _auth.userData!.nim!,
                                          token: "LogOut")
                                      .then((value) {
                                    return Get.offAllNamed("/login");
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget _userMenu({required String title, Function()? onTap, Widget? icon}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Pallete.primaryLight.withAlpha(50)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: icon ?? const SizedBox(),
            ),
          ),
          Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  title,
                  style: Get.textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),
                ),
              )),
          const Icon(Icons.arrow_forward_ios_rounded, size: 18),
        ],
      ),
    );
  }

  Widget _expansionChildren(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Pallete.primaryLight.withAlpha(50)),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: Pallete.primaryLight,
              ),
            ),
          ),
          Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(title, style: Get.textTheme.bodyText1),
              )),
        ],
      ),
    );
  }

  Widget _masaStudiStats({required String title, required String detail, required Color color}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: Get.textTheme.bodyText2,
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
                child: AutoSizeText(
              detail,
              maxLines: 1,
              stepGranularity: 2.0,
              minFontSize: 10,
              overflow: TextOverflow.ellipsis,
              style: Get.textTheme.bodyText1?.copyWith(color: Pallete.white),
            )),
          ),
        )
      ],
    );
  }
}
