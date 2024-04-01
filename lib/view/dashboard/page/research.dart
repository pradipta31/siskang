import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:siskangv2/components/search_bar.dart';
import 'package:siskangv2/core/common/research_grouping_enum.dart';
import 'package:siskangv2/core/controller/auth_controller.dart';
import 'package:siskangv2/core/controller/research_controller.dart';
import 'package:siskangv2/themes/asset_dir.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/view/account/widget/profile_textfield.dart';
import 'package:siskangv2/view/dashboard/widget/research_card.dart';
import 'package:siskangv2/widget/button_main.dart';

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
  int? _startYear;
  int? _endYear;
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
                _search != "" && _search != null ? _search! : "Penelitian",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Get.textTheme.headline4
                    ?.copyWith(color: Pallete.white, fontWeight: FontWeight.w700),
              ),
              secondChild: SearchBarComponent(
                focusNode: _focusNode,
                hint: "Search",
                trailing: GestureDetector(
                  onTap: () async {
                    await Get.bottomSheet<Map<String, String>>(_bottomSheetSearch()).then((value) {
                      setState(() {});
                    });
                  },
                  child: Icon(
                    Icons.menu,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
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
                          // int length = controller.lengthOfResearchList(_search);
                          var data = controller.researchData(_search,
                              start: _startYear ?? 0, end: _endYear ?? 0);
                          return ListView.builder(
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: ResearchCard(data: data[index]),
                            ),
                            itemCount: data.length,
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

  Widget _bottomSheetSearch() {
    final GlobalKey<FormState> _formKeyOne = GlobalKey<FormState>();

    savedUpdate() {
      if (_formKeyOne.currentState!.validate()) {
        // save
        _formKeyOne.currentState!.save();
      }
    }

    return Container(
      width: Get.width,
      height: Get.bottomBarHeight,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Get.theme.shadowColor,
                blurRadius: 8,
                offset: const Offset(0, -1),
                spreadRadius: 1),
          ],
          shape: BoxShape.rectangle,
          borderRadius:
              const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKeyOne,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Cari Angkatan",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Get.textTheme.headline4
                    ?.copyWith(color: Pallete.primaryLight, fontWeight: FontWeight.w700),
                textAlign: TextAlign.left,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: ProfileTextfield(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintText: "Mulai",
                      initialValue: _startYear != null ? _startYear.toString() : null,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        if (value.isNotEmpty) {
                          _startYear = int.parse(value);
                        } else {
                          _startYear = null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      " - ",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Get.textTheme.bodyLarge
                          ?.copyWith(color: Pallete.black, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ProfileTextfield(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintText: "Hingga",
                      initialValue: _endYear != null ? _endYear.toString() : null,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        if (value.isNotEmpty) {
                          _endYear = int.parse(value);
                        } else {
                          _endYear = null;
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: () {
                      savedUpdate();
                      Get.back();
                    },
                    child: ButtonMain(
                      height: 50,
                      width: Get.width,
                      text: "Terapkan",
                      textColor: Pallete.white,
                      buttonColor: Pallete.primaryLight,
                    ),
                  ),
                ],
              )
            ],
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
        child: text,
      ),
    );
  }
}
