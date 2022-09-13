import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardMenus extends StatelessWidget {
  final double? iconSize, borderRadius;
  final Color? color, iconColor;
  final String? icon;
  const DashboardMenus(
      {Key? key, this.color, this.icon, this.iconColor, this.iconSize, this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 16)),
        color: color,
      ),
      child: Center(
          child: icon != null
              ? SvgPicture.asset(
                  icon!,
                  fit: BoxFit.fill,
                  height: iconSize ?? 14,
                  width: iconSize ?? 14,
                  color: iconColor,
                )
              : Icon(
                  Icons.question_mark,
                  color: iconColor,
                  size: iconSize ?? 14,
                )),
    );
  }
}
