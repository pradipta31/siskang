import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:siskangv2/core/model/schedule_model.dart';
import 'package:siskangv2/themes/asset_dir.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/widget/status_badge.dart';

class ScheduleCard extends StatelessWidget {
  ScheduleModel data;
  ScheduleCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      child: Image.network(
                        data.fotoMhs!,
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
                      data.nama!,
                      style: Get.textTheme.headline5
                          ?.copyWith(fontWeight: FontWeight.bold, color: Pallete.primaryLight),
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
                        data.jenisUjian!,
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
              data.judul.toString().toUpperCase(),
              style: Get.textTheme.headline5
                  ?.copyWith(fontWeight: FontWeight.bold, color: Pallete.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
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
                                      ? data.pembimbing1.toString().toUpperCase()
                                      : data.pembimbing2.toString().toUpperCase(),
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
                                      ? data.penguji1.toString().toUpperCase()
                                      : data.penguji2.toString().toUpperCase(),
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
                            data.tgl.toString().toUpperCase(),
                            style: Get.textTheme.headline6
                                ?.copyWith(fontWeight: FontWeight.w600, color: Pallete.black),
                          ),
                          Text(
                            "${data.waktuMulai} - ${data.waktuSelesai}".toString().toUpperCase(),
                            style: Get.textTheme.headline6
                                ?.copyWith(fontWeight: FontWeight.w600, color: Pallete.black),
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
                    data.ruangan.toString().toUpperCase(),
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
    );
  }
}
