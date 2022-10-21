import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DashboardMenu extends StatelessWidget {
  double? width;
  double? height;
  Color? buttonColor;
  String svgIcon;
  Color? iconColor;
  double? borderRadius;
  String menuName;
  double? iconWidth;
  double? iconHeight;
  DashboardMenu(
      {Key? key,
      this.buttonColor,
      this.iconHeight,
      this.iconWidth,
      this.borderRadius,
      this.height,
      this.width,
      this.iconColor,
      required this.svgIcon,
      required this.menuName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 9,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius ?? 10), color: buttonColor),
            child: const Center(
              child: Icon(Icons.ac_unit_sharp, size: 14),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(menuName,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.black)),
        )
      ],
    );
  }
}
