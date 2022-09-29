import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siskangv2/themes/color_pallete.dart';

class StatusBadge extends StatelessWidget {
  final double? width, height, borderWidth, borderRadius;
  final Color? border, color;
  final Widget? text;
  const StatusBadge(
      {Key? key,
      this.width,
      this.height,
      this.borderWidth,
      this.borderRadius,
      this.color,
      this.border,
      this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: border ?? Pallete.transparent, width: borderWidth ?? 2),
        borderRadius: BorderRadius.circular(borderRadius ?? 40),
        color: color ?? Pallete.buttonMainColor,
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Center(
          child: text ??
              Text(
                "OK",
                style: Get.textTheme.subtitle1?.copyWith(color: Pallete.white),
              ),
        ),
      ),
    );
  }
}
