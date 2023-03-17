import 'package:another_stepper/utils/utils.dart';
// import 'package:another_stepper/widgets/stepper_dot_widget.dart';
import 'package:siskangv2/widget/stepper_dot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siskangv2/themes/color_pallete.dart';

class ResearchTimeline extends StatelessWidget {
  /// Title of timeline
  final String title;

  /// Status of timeline
  final String? statusText;

  /// Date of timeline
  final String? statusDate;

  /// Index at which the item is present
  final int index;

  /// Total length of the list provided
  final int totalLength;

  /// Active index which needs to be highlighted and before that
  final int activeIndex;

  /// Gap between the items in the stepper
  final double gap;

  /// Inverts the stepper with text that is being used
  final bool isInverted;

  /// Bar color for active step
  final Color activeBarColor;

  /// Bar color for inactive step
  final Color inActiveBarColor;

  /// Bar width/thickness
  final double barWidth;

  /// [Widget] for dot/point
  final Widget? dotWidget;

  /// [TextStyle] for title
  final TextStyle titleTextStyle;

  /// [TextStyle] for subtitle
  final TextStyle subtitleTextStyle;

  /// [TextStyle] for date
  final TextStyle dateTextStyle;
  const ResearchTimeline(
      {Key? key,
      required this.title,
      this.statusText,
      this.statusDate,
      required this.index,
      required this.totalLength,
      required this.activeIndex,
      required this.gap,
      required this.isInverted,
      required this.activeBarColor,
      required this.inActiveBarColor,
      required this.barWidth,
      this.dotWidget,
      required this.titleTextStyle,
      required this.subtitleTextStyle,
      required this.dateTextStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: isInverted ? getInvertedChildren() : getChildren(),
    );
  }

  List<Widget> getChildren() {
    return [
      Column(
        children: [
          Container(
            color: index == 0
                ? Colors.transparent
                : (index <= activeIndex ? activeBarColor : inActiveBarColor),
            width: barWidth,
            height: gap,
          ),
          index <= activeIndex
              ? dotWidget ??
                  StepperDot(
                    index: index,
                    totalLength: totalLength,
                    activeIndex: activeIndex,
                  )
              : ColorFiltered(
                  colorFilter: Utils.getGreyScaleColorFilter(),
                  child: dotWidget ??
                      StepperDot(
                        index: index,
                        totalLength: totalLength,
                        activeIndex: activeIndex,
                      ),
                ),
          Container(
            color: index == totalLength - 1
                ? Colors.transparent
                : (index < activeIndex ? activeBarColor : inActiveBarColor),
            width: barWidth,
            height: gap,
          ),
        ],
      ),
      const SizedBox(width: 8),
      Expanded(
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
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: titleTextStyle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (statusText != null) ...{
                        Text(
                          statusText!,
                          style: subtitleTextStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      }
                    ],
                  ),
                ),
                if (statusDate != null) ...{
                  Text(
                    statusDate!,
                    textAlign: TextAlign.center,
                    style: dateTextStyle.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                  )
                }
              ],
            ),
          ),
        ),
      ),
    ];
  }

  List<Widget> getInvertedChildren() {
    return getChildren().reversed.toList();
  }
}
