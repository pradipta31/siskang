import 'package:another_stepper/another_stepper.dart';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/horizontal_stepper.dart';
import 'package:another_stepper/widgets/vertical_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';
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
  late TabController controller;
  String nama = "I Gede Pradipta Adi Nugraha, S.Kom";

  @override
  void initState() {
    controller = TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
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
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Pallete.backgroundUncover,
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Halo, $nama",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Get.textTheme.headline4
                                  ?.copyWith(fontWeight: FontWeight.w700, color: Pallete.black),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Selamat datang di SisKa-NG",
                              style: Get.textTheme.bodyText1,
                            )
                          ],
                        )),
                    Expanded(
                      flex: 1,
                      child: StatusBadge(
                        color: Pallete.activeColor,
                        text: Text(
                          "Aktif",
                          maxLines: 1,
                          style: Get.textTheme.bodyText1?.copyWith(color: Pallete.white),
                        ),
                      ),
                    )
                  ],
                ),
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
                  ListView.builder(
                    itemCount: _dummyData().length,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => VerticalStepperItem(
                      item: StepperData(
                          title: _dummyData()[index].first, subtitle: _dummyData()[index].last),
                      index: index,
                      totalLength: _dummyData().length,
                      gap: 30,
                      activeIndex: 2,
                      isInverted: false,
                      activeBarColor: Pallete.primaryLight,
                      inActiveBarColor: Colors.grey,
                      barWidth: 2,
                      dotWidget: Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Pallete.primaryLight,
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
                  ),
                  // AnotherStepper(
                  //     stepperList: _dummyData()
                  //         .map((e) => StepperData(title: e.elementAt(1), subtitle: e.last))
                  //         .toList(),
                  //     titleTextStyle: Get.textTheme.headline4!,
                  //     subtitleTextStyle: Get.textTheme.bodyText1!,
                  //     gap: 30,
                  //     activeIndex: 2,
                  //     horizontalStepperHeight: 70,
                  //     scrollPhysics: NeverScrollableScrollPhysics(),
                  //     dotWidget: Container(
                  //       height: 30,
                  //       width: 30,
                  //       decoration: BoxDecoration(
                  //         shape: BoxShape.circle,
                  //         color: Pallete.primaryLight,
                  //       ),
                  //     ),
                  //     activeBarColor: Pallete.primaryLight,
                  //     stepperDirection: Axis.vertical),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: Material(
          color: const Color.fromARGB(255, 93, 126, 143),
          child: TabBar(
            controller: controller,
            tabs: [
              const Tab(icon: Icon(Icons.sports_bar)),
              const Tab(icon: Icon(Icons.sports_soccer)),
              const Tab(icon: Icon(Icons.sports_mma)),
              const Tab(icon: Icon(Icons.sports_tennis)),
            ],
          ),
        ),
      ),
    );
  }

  List<Set<String>> _dummyData() {
    return [
      {"Pengajuan Proposal", "09 Sep 2022"},
      {"Upload Proposal", "09 Sep 2022"},
      {"Ujian Proposal", "09 Sep 2022"},
      {"Revisi Proposal", "TBA"},
      {"Bimbingan Tesis", "TBA"},
      {"Ujian Tesis", "TBA"}
    ];
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
