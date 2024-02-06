import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:siskangv2/components/search_bar.dart';
import 'package:siskangv2/core/common/research_grouping_enum.dart';
import 'package:siskangv2/core/controller/auth_controller.dart';
import 'package:siskangv2/core/controller/research_controller.dart';
import 'package:siskangv2/core/model/research_timeline_model.dart';
import 'package:siskangv2/themes/asset_dir.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/view/dashboard/widget/research_card.dart';

class Research extends StatefulWidget {
  const Research({Key? key}) : super(key: key);

  @override
  State<Research> createState() => _ResearchState();
}

class _ResearchState extends State<Research> {
  final _research = Get.find<ResearchController>();
  final _auth = Get.find<AuthController>();
  final FocusNode _focusNode = FocusNode();
  String? _search;
  bool _showSearch = false;

  // List<ResearchTimelineModel> data = [];

  @override
  void initState() {
    _getData();
    super.initState();
  }

  _getData() async {
    await _research.getAllResearch(idProdi: _auth.userData!.prodiId!);
    setState(() {});
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
                _search ?? "Penelitian",
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
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(4, 0, 4, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: _buttonStatistic(
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                    child: Center(
                                      child: Text(
                                        "Topik Penelitian",
                                        style: Get.textTheme.bodyText1!.copyWith(
                                            color: const Color.fromARGB(255, 82, 129, 223)),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ), onTap: () {
                                Get.toNamed('/research/graph',
                                    arguments: [ResearchGrouping.TOPIK, true]);
                              }, color: Pallete.white, height: 50),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: _buttonStatistic(
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                    child: Center(
                                      child: Text(
                                        "Pembimbing",
                                        style: Get.textTheme.bodyText1!.copyWith(
                                            color: const Color.fromARGB(255, 82, 129, 223)),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ), onTap: () {
                                Get.toNamed('/research/graph',
                                    arguments: [ResearchGrouping.PEMBIMBING, true]);
                              }, color: Pallete.white, height: 50),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: _buttonStatistic(
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                    child: Center(
                                      child: Text(
                                        "Tahapan",
                                        style: Get.textTheme.bodyText1!.copyWith(
                                            color: const Color.fromARGB(255, 82, 129, 223)),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ), onTap: () {
                                Get.toNamed('/research/graph',
                                    arguments: [ResearchGrouping.TAHAP, true]);
                              }, color: Pallete.white, height: 50),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GetBuilder<ResearchController>(
                      builder: (controller) {
                        if (controller.allResearch.isNotEmpty) {
                          int length = controller.lengthOfResearchList(_search);
                          var data = controller.researchData(_search);
                          return ListView.builder(
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: ResearchCard(data: data[index]),
                            ),
                            itemCount: length,
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(16),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                    // child: FutureBuilder<List<ResearchTimelineModel>>(
                    //     future: _research.getAllResearch(idProdi: _auth.userData!.prodiId!),
                    //     builder: (context, snapshot) {
                    //       if (snapshot.connectionState == ConnectionState.done &&
                    //           snapshot.hasData) {
                    //         return ListView.builder(
                    //           itemBuilder: (context, index) => Padding(
                    //             padding: const EdgeInsets.only(bottom: 16),
                    //             child: ResearchCard(data: snapshot.data![index]),
                    //           ),
                    //           itemCount: snapshot.data!.length,
                    //           shrinkWrap: true,
                    //           padding: const EdgeInsets.all(16),
                    //         );
                    //       } else if (snapshot.connectionState == ConnectionState.waiting) {
                    //         return const Center(
                    //           child: CircularProgressIndicator(),
                    //         );
                    //       } else if (snapshot.connectionState == ConnectionState.done &&
                    //           !snapshot.hasData) {
                    //         return const SizedBox();
                    //       } else {
                    //         return const Center(
                    //           child: Text("ERROR"),
                    //         );
                    //       }
                    //     }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonStatistic(Widget text,
      {Function()? onTap, Color? borderColor, Color? color, double? width, double? height}) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      splashColor: Pallete.lightGrey.withOpacity(0.2),
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        child: text,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // color: color,
          // boxShadow: [
          //   BoxShadow(
          //       color: Pallete.darkGrey.withOpacity(0.16),
          //       blurRadius: 2,
          //       offset: const Offset(0, 3),
          //       spreadRadius: 2)
          // ],
          border: Border.all(color: borderColor ?? Pallete.primaryLight, width: 1),
        ),
      ),
    );
  }
}
