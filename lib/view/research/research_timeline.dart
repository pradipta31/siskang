import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siskangv2/core/common/links.dart';
import 'package:siskangv2/core/controller/research_controller.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/view/dashboard/widget/research_timeline.dart';

class ResearchOtherTimeline extends StatelessWidget {
  const ResearchOtherTimeline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments;
    var _researchController = Get.find<ResearchController>();

    _researchController.getOtherResearchTimelineByNim(nim: data);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Pallete.primaryLight,
          titleSpacing: 8,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Timeline",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Get.textTheme.headline4
                  ?.copyWith(color: Pallete.white, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Timeline Penelitian",
                      style: Get.textTheme.headline3,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    GetBuilder<ResearchController>(
                        init: Get.find<ResearchController>(),
                        builder: (research) {
                          return ListView.builder(
                            itemCount: research.otherListedResearchimeline.length,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) => ResearchTimeline(
                              title: research.otherListedResearchimeline[index].name!,
                              statusText: research.otherListedResearchimeline[index].statusText,
                              statusDate: research.otherListedResearchimeline[index].date != null
                                  ? dateToString(
                                          date: stringToDate(
                                              date:
                                                  research.otherListedResearchimeline[index].date!),
                                          format: "dd MMM")
                                      .replaceAll(" ", "\n")
                                  : null,
                              dateTextStyle: Get.textTheme.headline5!
                                  .copyWith(color: Pallete.darkGrey.withOpacity(0.7)),
                              index: index,
                              totalLength: research.otherListedResearchimeline.length,
                              gap: 30,
                              activeIndex: research.otherListedResearchimeline.any((e) => !e.status)
                                  ? research.otherListedResearchimeline.indexWhere((e) => !e.status)
                                  : research.otherListedResearchimeline.length - 1,
                              isInverted: false,
                              activeBarColor: Pallete.primaryLight,
                              inActiveBarColor: Colors.grey,
                              barWidth: 2,
                              dotWidget: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: index <=
                                              research.otherListedResearchimeline
                                                  .indexWhere((e) => !e.status) ||
                                          research.otherListedResearchimeline
                                                  .indexWhere((e) => !e.status) ==
                                              -1
                                      ? Pallete.primaryLight
                                      : Colors.grey,
                                ),
                                child: Center(
                                  child: Text(
                                    "${index + 1}",
                                    style: Get.textTheme.bodyText1!.copyWith(color: Pallete.white),
                                  ),
                                ),
                              ),
                              titleTextStyle:
                                  Get.textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),
                              subtitleTextStyle: Get.textTheme.bodyText1!,
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
