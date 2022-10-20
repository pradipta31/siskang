import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/vertical_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:siskangv2/core/controller/auth_controller.dart';
import 'package:siskangv2/core/controller/research_controller.dart';
import 'package:siskangv2/themes/asset_dir.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/view/dashboard/widget/menus.dart';
import 'package:siskangv2/widget/status_badge.dart';

class MasterPage extends StatefulWidget {
  const MasterPage({Key? key}) : super(key: key);

  @override
  State<MasterPage> createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
              "Dashboard",
              style: Get.textTheme.headline4
                  ?.copyWith(color: Pallete.white, fontWeight: FontWeight.w700),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  AssetsDirectory.notificationOff,
                  color: Pallete.white,
                ),
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            Container(
              color: Pallete.backgroundUncover,
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 4,
                                child: GetBuilder<AuthController>(
                                    init: Get.find<AuthController>(),
                                    builder: (auth) {
                                      return Text(
                                        "Halo, ${auth.userData?.name}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Get.textTheme.headline4?.copyWith(
                                            fontWeight: FontWeight.w700, color: Pallete.black),
                                      );
                                    }),
                              ),
                              Expanded(
                                flex: 1,
                                child: GetBuilder<ResearchController>(
                                    init: Get.find<ResearchController>(),
                                    builder: (res) {
                                      if (res.masaStudi == null) {
                                        return Shimmer.fromColors(
                                          baseColor: Pallete.mediumLightGrey,
                                          highlightColor: Colors.grey[300]!,
                                          direction: ShimmerDirection.ltr,
                                          period: Duration(seconds: 2),
                                          child: StatusBadge(
                                            color: Pallete.darkGrey,
                                            text: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Text(
                                                "Waiting",
                                                maxLines: 1,
                                                style: Get.textTheme.bodyText1
                                                    ?.copyWith(color: Pallete.white),
                                              ),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return StatusBadge(
                                          color: res.masaStudi?.status?.toUpperCase() == "IN STUDI"
                                              ? Pallete.activeColor
                                              : const Color.fromARGB(255, 177, 18, 6),
                                          text: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              res.masaStudi?.status?.toUpperCase() == "IN STUDI"
                                                  ? "Aktif"
                                                  : "Tidak Aktif",
                                              maxLines: 1,
                                              textAlign: TextAlign.center,
                                              style: Get.textTheme.bodyText1
                                                  ?.copyWith(color: Pallete.white),
                                            ),
                                          ),
                                        );
                                      }
                                    }),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "Selamat datang di SisKa-NG",
                          style: Get.textTheme.bodyText1,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: Get.width,
              color: Pallete.background,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GridView.count(
                    crossAxisCount: 4,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 4 / 5,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    children: List.generate(
                        4,
                        (index) => Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                    child: _menus(index, true),
                                  ),
                                ),
                                _menus(index, false)
                              ],
                            )),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Timeline Penelitian",
                    style: Get.textTheme.headline3,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GetBuilder<ResearchController>(
                      init: Get.find<ResearchController>(),
                      builder: (research) {
                        return ListView.builder(
                          //TODO: Sementara static krn respon dari API bukan list
                          itemCount: research.listedResearchimeline.length,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => VerticalStepperItem(
                            item: StepperData(
                                title: research.listedResearchimeline[index].name,
                                subtitle: research.listedResearchimeline[index].date),
                            index: index,
                            totalLength: research.listedResearchimeline.length,
                            gap: 30,
                            activeIndex:
                                research.listedResearchimeline.indexWhere((e) => !e.status),
                            // research.listedResearchimeline.indexWhere((e) => !e.status) > 0
                            //     ? research.listedResearchimeline.indexWhere((e) => !e.status) -
                            //         1
                            //     : research.listedResearchimeline.length,
                            isInverted: false,
                            activeBarColor: Colors.red,
                            inActiveBarColor: Colors.grey,
                            barWidth: 2,
                            dotWidget: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index <=
                                        research.listedResearchimeline.indexWhere((e) => !e.status)
                                    ? Pallete.primaryLight
                                    : Colors.grey,
                              ),
                              child: Center(
                                child: Text(
                                  "${index + 1}",
                                  style: Get.textTheme.bodyText1!.copyWith(color: Pallete.white),
                                ),
                              ),
                            ),
                            titleTextStyle: Get.textTheme.headline4!,
                            subtitleTextStyle: Get.textTheme.bodyText1!,
                          ),
                        );
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  dynamic _menus(int index, bool isNeedWidget) {
    if (isNeedWidget) {
      switch (index) {
        case 0:
          return const DashboardMenus(
            icon: AssetsDirectory.bookOpen,
            color: Color(0xff316d86),
            iconColor: Pallete.white,
            iconSize: 24,
            borderRadius: 26,
          );
        case 1:
          return const DashboardMenus(
            icon: AssetsDirectory.graduationCap,
            color: Color(0xff27487f),
            iconColor: Pallete.white,
            iconSize: 24,
            borderRadius: 26,
          );
        case 2:
          return const DashboardMenus(
            icon: AssetsDirectory.bookCloed,
            color: Color(0xfff59e0b),
            iconColor: Pallete.white,
            iconSize: 24,
            borderRadius: 26,
          );
        case 3:
          return const DashboardMenus(
            icon: AssetsDirectory.checkbox,
            color: Color(0xff46bd84),
            iconColor: Pallete.white,
            iconSize: 24,
            borderRadius: 26,
          );
        default:
      }
    } else {
      switch (index) {
        case 0:
          return Text(
            "Berita",
            style: Get.textTheme.bodyMedium,
          );
        case 1:
          return Text(
            "Jadwal",
            style: Get.textTheme.bodyMedium,
          );
        case 2:
          return Text(
            "Penelitian",
            style: Get.textTheme.bodyMedium,
          );
        case 3:
          return Text(
            "Statistik",
            style: Get.textTheme.bodyMedium,
          );
        default:
      }
    }
  }
}
