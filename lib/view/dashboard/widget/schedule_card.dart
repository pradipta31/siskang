import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:siskangv2/core/common/links.dart';
import 'package:siskangv2/core/model/schedule_model.dart';
import 'package:siskangv2/themes/asset_dir.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/widget/status_badge.dart';

class ScheduleCard extends StatefulWidget {
  final ScheduleModel data;
  const ScheduleCard({Key? key, required this.data}) : super(key: key);

  @override
  State<ScheduleCard> createState() => _ScheduleCardState();
}

class _ScheduleCardState extends State<ScheduleCard> with TickerProviderStateMixin {
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: ClipOval(
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(48),
                                child: Image.network(
                                  widget.data.fotoMhs!,
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
                              child: Text(
                                widget.data.nama!,
                                style: Get.textTheme.headline6?.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: Color.fromARGB(255, 111, 113, 232)),
                              )),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            flex: 2,
                            child: StatusBadge(
                              color: Color.fromRGBO(70, 189, 132, 1),
                              borderRadius: 20,
                              text: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  widget.data.jenisUjian!,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: Get.textTheme.bodyText2
                                      ?.copyWith(color: Pallete.white, fontSize: 9),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        widget.data.judul.toString().toUpperCase(),
                        style: Get.textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: Color.fromRGBO(51, 65, 85, 1),
                            fontSize: 15),
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
                      turns: Tween(begin: 0.5, end: 1.0).animate(_animationController),
                      child: const Icon(Icons.keyboard_arrow_down_rounded)),
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
      axisAlignment: 1.0,
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
                                style: Get.textTheme.headline6?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(51, 65, 85, 0.7)),
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
                                    ? widget.data.penguji1.toString().toUpperCase()
                                    : widget.data.penguji2.toString().toUpperCase(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Get.textTheme.headline6?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(51, 65, 85, 0.7)),
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
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dateToString(date: stringToDate(date: widget.data.tgl.toString()))
                              .toUpperCase(),
                          style: Get.textTheme.headline6?.copyWith(
                              fontWeight: FontWeight.w600, color: Color.fromRGBO(51, 65, 85, 0.7)),
                        ),
                        Text(
                          "${timeToString(time: stringToTime(time: widget.data.waktuMulai!), context: context)} - ${timeToString(time: stringToTime(time: widget.data.waktuSelesai!, format: "HH-mm"), context: context)}",
                          style: Get.textTheme.headline6?.copyWith(
                              fontWeight: FontWeight.w600, color: Color.fromRGBO(51, 65, 85, 0.7)),
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
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: Text(
                  widget.data.ruangan.toString().toUpperCase(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Get.textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.w600, color: Color.fromRGBO(51, 65, 85, 0.7)),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
