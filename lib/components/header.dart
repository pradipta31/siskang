import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siskangv2/themes/color_pallete.dart';

class HeaderMain extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function? onBack;
  final Widget? trailingIcon;
  const HeaderMain(
      {Key? key,
      required this.title,
      this.iconData = Icons.arrow_back_sharp,
      this.onBack,
      this.trailingIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Pallete.white, boxShadow: [
        BoxShadow(
            color: Pallete.darkGrey.withOpacity(0.16),
            blurRadius: 6,
            offset: const Offset(0, 3),
            spreadRadius: 4)
      ]),
      child: Stack(
        children: [
          Material(
            type: MaterialType.transparency,
            borderRadius: BorderRadius.circular(28),
            child: InkWell(
              borderRadius: BorderRadius.circular(28),
              splashColor: Pallete.white.withOpacity(0.8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(iconData),
                  onPressed: onBack as void Function()? ??
                      () {
                        Get.back();
                      },
                  color: Pallete.darkGrey,
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              title,
              style: Get.textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          if (trailingIcon != null) ...{trailingIcon!}
        ],
      ),
    );
  }
}
