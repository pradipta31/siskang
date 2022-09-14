import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:siskangv2/themes/asset_dir.dart';
import 'package:siskangv2/themes/color_pallete.dart';

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
        body: ListView(),
      ),
    );
  }

  List<Set<String>> _dummyData() {
    return [{}];
  }
}
