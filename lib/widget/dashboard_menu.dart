import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                borderRadius: BorderRadius.circular(borderRadius ?? 10),
                color: buttonColor),
            child: Center(
              child: Icon(Icons.ac_unit_sharp, size: 14),
              // child: SvgPicture.asset(
              //   svgIcon,
              //   width: iconWidth,
              //   height: iconHeight,
              // ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(menuName,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black)),
        )
      ],
    );
  }
}
