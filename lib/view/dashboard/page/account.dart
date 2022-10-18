import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siskangv2/core/controller/auth_controller.dart';
import 'package:siskangv2/core/controller/research_controller.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/widget/status_badge.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

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
                              return ClipOval(
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(48),
                                  child: Image.network(
                                    auth.userPhoto("18e64045a898fbfe78c2e9a441ffe75d.jpg"),
                                    fit: BoxFit.fill,
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
                          })
                    ],
                  ),
                )
              ],
            )),
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
              child: Text(
                detail,
                style: Get.textTheme.bodyText1?.copyWith(color: Pallete.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
