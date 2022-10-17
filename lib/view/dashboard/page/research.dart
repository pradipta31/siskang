import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:siskangv2/core/common/links.dart';
import 'package:siskangv2/core/controller/auth_controller.dart';
import 'package:siskangv2/core/controller/research_controller.dart';
import 'package:siskangv2/core/controller/schedule_controller.dart';
import 'package:siskangv2/core/model/research_timeline_model.dart';
import 'package:siskangv2/themes/asset_dir.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/view/dashboard/widget/research_card.dart';

class Research extends StatelessWidget {
  final _auth = Get.find<AuthController>();
  final _research = Get.find<ResearchController>();
  Research({Key? key}) : super(key: key);

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
          child: FutureBuilder<List<ResearchTimelineModel>>(
              future: _research.getAllResearch(idProdi: _auth.userData!.prodiId!),
              builder: (context, snapshot) => snapshotChecker(snapshot,
                  mainWidget: ListView.builder(
                    itemBuilder: (context, index) => ResearchCard(data: snapshot.data![index]),
                    itemCount: snapshot.data!.length,
                  ))),
        ),
      ),
    );
  }
}
