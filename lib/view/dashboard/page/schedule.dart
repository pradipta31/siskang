import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:siskangv2/components/search_bar.dart';
import 'package:siskangv2/core/controller/auth_controller.dart';
import 'package:siskangv2/core/controller/schedule_controller.dart';
import 'package:siskangv2/themes/asset_dir.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/view/dashboard/widget/schedule_card.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final _schedule = Get.find<ScheduleController>();
  final _auth = Get.find<AuthController>();
  final FocusNode _focusNode = FocusNode();
  String? _search;
  bool _showSearch = false;
  @override
  void initState() {
    _schedule.getSchedule(nim: _auth.userData!.nim!, idProdi: _auth.userData!.prodiId!);
    super.initState();
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
            child: AnimatedCrossFade(
              firstChild: Text(
                _search ?? "Jadwal",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Get.textTheme.headline4
                    ?.copyWith(color: Pallete.white, fontWeight: FontWeight.w700),
              ),
              secondChild: SearchBarComponent(
                focusNode: _focusNode,
                hint: "Search",
                searchQuery: (value) {
                  setState(() {
                    _search = value;
                  });
                },
              ),
              crossFadeState: !_showSearch ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 200),
              firstCurve: Curves.fastOutSlowIn,
              secondCurve: Curves.fastOutSlowIn,
              reverseDuration: const Duration(microseconds: 200),
              sizeCurve: Curves.linearToEaseOut,
            ),
          ),
          actions: [
            _showSearch
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showSearch = true;
                        });
                      },
                      child: SvgPicture.asset(
                        AssetsDirectory.search,
                        color: Pallete.white,
                      ),
                    ),
                  )
          ],
        ),
        body: GestureDetector(
          onPanDown: (details) {
            setState(() {
              _focusNode.unfocus();
              _showSearch = false;
            });
          },
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: GetBuilder<ScheduleController>(builder: (schedule) {
              int length = schedule.lengthOfSearchedList(_search);
              var data = schedule.scheduleData(_search);
              return ListView.builder(
                itemCount: length,
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: ScheduleCard(data: data[index])),
              );
            }),
          ),
        ),
      ),
    );
  }
}
