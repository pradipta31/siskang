import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siskangv2/themes/color_pallete.dart';

class MainActionButton extends StatelessWidget {
  Function()? onTap;
  String label;
  Color? textColor, border, color;
  double? width, height, borderRadius;
  MainActionButton(
      {Key? key,
      this.onTap,
      this.label = "OK",
      this.textColor,
      this.border,
      this.color,
      this.width,
      this.borderRadius,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: border ?? Pallete.transparent, width: 2),
        borderRadius: BorderRadius.circular(borderRadius ?? 40),
        color: color ?? Pallete.buttonMainColor,
      ),
      child: Material(
        color: Pallete.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          splashColor: Pallete.lightGrey.withOpacity(0.2),
          onTap: onTap,
          child: Center(
            child: Text(
              label,
              style: Get.textTheme.subtitle1?.copyWith(color: textColor ?? Pallete.white),
            ),
          ),
        ),
      ),
    );
  }
}
