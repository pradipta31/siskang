import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:siskangv2/themes/asset_dir.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/widget/status_badge.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key? key}) : super(key: key);

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
              "Jadwal",
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
                  AssetsDirectory.search,
                  color: Pallete.white,
                ),
              ),
            )
          ],
        ),
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: ListView.builder(
            itemCount: _dummyData().length,
            shrinkWrap: true,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Pallete.backgroundUncover,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: ClipOval(
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(48),
                                child: Image.asset(
                                  _dummyData()[index]["profile"],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                              flex: 5,
                              child: Text(
                                _dummyData()[index]["name"],
                                style: Get.textTheme.headline5?.copyWith(
                                    fontWeight: FontWeight.bold, color: Pallete.primaryLight),
                              )),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            flex: 3,
                            child: StatusBadge(
                              color: Pallete.activeColor,
                              text: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _dummyData()[index]["status"],
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: Get.textTheme.bodyText2?.copyWith(color: Pallete.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        _dummyData()[index]["title"].toString().toUpperCase(),
                        style: Get.textTheme.headline5
                            ?.copyWith(fontWeight: FontWeight.bold, color: Pallete.black),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: const Divider(
                          thickness: 1.5,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AssetsDirectory.users,
                              fit: BoxFit.contain,
                              height: 25,
                              width: 25,
                              color: Pallete.primaryLight,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                      _dummyData()[index]["pembimbing"].length,
                                      (idx) => Text(
                                            _dummyData()[index]["pembimbing"][idx]
                                                .toString()
                                                .toUpperCase(),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: Get.textTheme.headline6?.copyWith(
                                                fontWeight: FontWeight.w600, color: Pallete.black),
                                          ))),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AssetsDirectory.calendarLinesPen,
                              fit: BoxFit.contain,
                              height: 25,
                              width: 25,
                              color: Pallete.primaryLight,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                      _dummyData()[index]["penguji"].length,
                                      (idx) => Text(
                                            _dummyData()[index]["penguji"][idx]
                                                .toString()
                                                .toUpperCase(),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: Get.textTheme.headline6?.copyWith(
                                                fontWeight: FontWeight.w600, color: Pallete.black),
                                          ))),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AssetsDirectory.alarmClock,
                              fit: BoxFit.contain,
                              height: 25,
                              width: 25,
                              color: Pallete.primaryLight,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _dummyData()[index]["date"].toString().toUpperCase(),
                                      style: Get.textTheme.headline6?.copyWith(
                                          fontWeight: FontWeight.w600, color: Pallete.black),
                                    ),
                                    Text(
                                      "${_dummyData()[index]["timeStart"]} - ${_dummyData()[index]["timeEnd"]}"
                                          .toString()
                                          .toUpperCase(),
                                      style: Get.textTheme.headline6?.copyWith(
                                          fontWeight: FontWeight.w600, color: Pallete.black),
                                    ),
                                  ]),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AssetsDirectory.home,
                              fit: BoxFit.contain,
                              height: 25,
                              width: 25,
                              color: Pallete.primaryLight,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Expanded(
                                child: Text(
                              _dummyData()[index]["location"].toString().toUpperCase(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Get.textTheme.headline6
                                  ?.copyWith(fontWeight: FontWeight.w600, color: Pallete.black),
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> _dummyData() {
    return [
      {
        "name": "I Gede Pradipta Adi Nugraha, S.Kom",
        "profile": "asset/images/logo.png",
        "status": "Ujian Proposal",
        "title":
            "Pellentesque dui ante, consectetur in vulputate vel, vestibulum vitae sapien. Nunc feugiat libero",
        "pembimbing": ["Dr. Gede Indrawan, S.T., M.T", "Dr. I Gede Aris Gunadi, S.S.I., M.Kom"],
        "penguji": [
          "Kadek Yota Ernanda, S.Kom., M.T., Ph.",
          "Dr. Luh Joni Erawati Dewi, S.T., M.Pd"
        ],
        "date": "22-09-2022",
        "timeStart": "10.00",
        "timeEnd": "11.00",
        "location": "ILKOM-1"
      },
      {
        "name": "I Gede Pradipta Adi Nugraha, S.Kom",
        "profile": "asset/images/logo.png",
        "status": "Ujian Proposal",
        "title":
            "Pellentesque dui ante, consectetur in vulputate vel, vestibulum vitae sapien. Nunc feugiat libero",
        "pembimbing": ["Dr. Gede Indrawan, S.T., M.T", "Dr. I Gede Aris Gunadi, S.S.I., M.Kom"],
        "penguji": [
          "Kadek Yota Ernanda, S.Kom., M.T., Ph.",
          "Dr. Luh Joni Erawati Dewi, S.T., M.Pd"
        ],
        "date": "22-09-2022",
        "timeStart": "10.00",
        "timeEnd": "11.00",
        "location": "ILKOM-1"
      }
    ];
  }
}
