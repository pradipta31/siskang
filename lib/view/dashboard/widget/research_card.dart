import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:siskangv2/components/main_action_button.dart';
import 'package:siskangv2/core/model/research_timeline_model.dart';
import 'package:siskangv2/themes/asset_dir.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/widget/status_badge.dart';

class ResearchCard extends StatefulWidget {
  final ResearchTimelineModel data;
  const ResearchCard({Key? key, required this.data}) : super(key: key);

  @override
  State<ResearchCard> createState() => _ResearchCardState();
}

class _ResearchCardState extends State<ResearchCard> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool isExpanded = false;

  @override
  void initState() {
    _prepareAnimation();
    _runExpandCheck();
    super.initState();
  }

  void _prepareAnimation() {
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
        reverseDuration: const Duration(milliseconds: 500));
    _animation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
        reverseCurve: Curves.fastOutSlowIn);
  }

  void _runExpandCheck() {
    if (isExpanded) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
          _runExpandCheck();
        });
      },
      child: SizedBox(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
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
                                child: Image.network(
                                  widget.data.foto!,
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Image.asset("/asset/images/logo_undiksha.png"),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            flex: 5,
                            child: SizedBox(
                              width: Get.width,
                              height: 50,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: AutoSizeText(
                                  "${widget.data.nama} (${widget.data.angkatan})",
                                  maxLines: 2,
                                  stepGranularity: 2.0,
                                  minFontSize: 14,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style: Get.textTheme.headline6?.copyWith(
                                      fontWeight: FontWeight.w800,
                                      color: Color.fromARGB(255, 111, 113, 232)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.loose,
                            child: GestureDetector(
                              onTap: () {
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
                                    snackPosition: SnackPosition.BOTTOM,
                                    messageText: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          widget.data.nama ?? "",
                                          style: Get.textTheme.bodyText2!.copyWith(
                                              color: Pallete.white, fontWeight: FontWeight.w300),
                                        ),
                                        Text(
                                          widget.data.statusPenelitian?.toUpperCase() ?? "UNKNOWN",
                                          style: Get.textTheme.headline6!.copyWith(
                                              fontWeight: FontWeight.bold, color: Pallete.white),
                                        )
                                      ],
                                    ));
                              },
                              child: StatusBadge(
                                  height: 30,
                                  width: 30,
                                  color: widget.data.statusPenelitian!.toLowerCase() == "aktif"
                                      ? Pallete.activeColor
                                      : const Color.fromARGB(255, 177, 18, 6),
                                  text: const SizedBox()),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data.judul.toString().toUpperCase(),
                        style: Get.textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color.fromRGBO(40, 50, 66, 1)),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      _expandedInfo()
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                    _runExpandCheck();
                  });
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Pallete.backgroundUncover,
                      boxShadow: [
                        BoxShadow(
                            color: Pallete.darkGrey.withOpacity(0.16),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                            spreadRadius: 4)
                      ]),
                  child: RotationTransition(
                      turns: Tween(begin: 0.0, end: 0.5).animate(_animationController),
                      child: const Icon(Icons.keyboard_arrow_up_rounded)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _expandedInfo() {
    return SizeTransition(
      sizeFactor: _animation,
      axisAlignment: 1,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
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
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                          2,
                          (idx) => Text(
                                idx != 1
                                    ? widget.data.pembimbing1.toString().toUpperCase()
                                    : widget.data.pembimbing2.toString().toUpperCase(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Get.textTheme.headline6
                                    ?.copyWith(fontWeight: FontWeight.w600, color: Pallete.black),
                              ))),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: SizedBox(
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Flexible(
                  //   fit: FlexFit.loose,
                  //   child: MainActionButton(
                  //     height: 30,
                  //     width: Get.width / 4,
                  //     borderRadius: 30,
                  //     label: "Proposal",
                  //     fontSize: 12,
                  //     textColor: Pallete.white,
                  //     color: Pallete.selectedColor,
                  //   ),
                  // ),
                  // const SizedBox(
                  //   width: 8,
                  // ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: MainActionButton(
                      height: 30,
                      width: Get.width / 4,
                      borderRadius: 30,
                      fontSize: 12,
                      onTap: () {
                        Get.toNamed('/research_timeline', arguments: widget.data.nim);
                      },
                      label: "Timeline",
                      textColor: Pallete.white,
                      color: Pallete.selectedColor,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
