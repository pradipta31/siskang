import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:siskangv2/components/main_action_button.dart';
import 'package:siskangv2/core/model/research_timeline_model.dart';
import 'package:siskangv2/themes/asset_dir.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/widget/status_badge.dart';

class ResearchCard extends StatelessWidget {
  final ResearchTimelineModel data;
  const ResearchCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: Pallete.white, boxShadow: [
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
                        data.foto!,
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
                  child: SizedBox(
                    width: Get.width,
                    height: 50,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: AutoSizeText(
                        data.nama!,
                        maxLines: 2,
                        stepGranularity: 2.0,
                        minFontSize: 14,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: Get.textTheme.headline5
                            ?.copyWith(fontWeight: FontWeight.bold, color: Pallete.primaryLight),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: StatusBadge(
                    color: data.statusPenelitian!.toLowerCase() == "aktif"
                        ? Pallete.activeColor
                        : const Color.fromARGB(255, 177, 18, 6),
                    text: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        data.statusPenelitian!,
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
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: SizedBox(
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: MainActionButton(
                        height: 30,
                        width: Get.width / 4,
                        borderRadius: 30,
                        label: "Proposal",
                        fontSize: 12,
                        textColor: Pallete.white,
                        color: Pallete.selectedColor,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: MainActionButton(
                        height: 30,
                        width: Get.width / 4,
                        borderRadius: 30,
                        fontSize: 12,
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
      ),
    );
  }
}
