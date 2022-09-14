import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:siskangv2/themes/color_pallete.dart';

class BottomNavBar extends StatefulWidget {
  final Color backgroundColor;
  final Color itemColor;
  final List<CustomBottomNavigationItem> children;
  final Function(int)? onChange;
  final int currentIndex;
  const BottomNavBar(
      {Key? key,
      this.backgroundColor = Pallete.backgroundUncover,
      this.itemColor = Pallete.primaryLight,
      this.currentIndex = 0,
      required this.children,
      this.onChange})
      : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  void _changeIndex(int index) {
    if (widget.onChange != null) {
      widget.onChange!(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Pallete.darkGrey.withOpacity(0.15),
            blurRadius: 5,
            offset: const Offset(0, -3),
            spreadRadius: 2)
      ], color: widget.backgroundColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.children.map((item) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
            child: Material(
              color: Pallete.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                splashColor: Pallete.lightGrey.withOpacity(0.2),
                onTap: () => _changeIndex(widget.children.indexOf(item)),
                child: item.icon != null
                    ? Icon(
                        item.icon!,
                        size: 20,
                        color: widget.currentIndex == widget.children.indexOf(item)
                            ? widget.itemColor
                            : Pallete.darkGrey.withOpacity(0.5),
                      )
                    : SvgPicture.asset(item.customIcon!,
                        fit: BoxFit.contain,
                        width: 20,
                        height: 20,
                        color: widget.currentIndex == widget.children.indexOf(item)
                            ? widget.itemColor
                            : Pallete.darkGrey.withOpacity(0.5)),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class CustomBottomNavigationItem {
  final IconData? icon;
  final String label;
  final Color? color;
  final String? customIcon;
  final bool isNotified;

  CustomBottomNavigationItem(
      {this.icon, required this.label, this.color, this.isNotified = false, this.customIcon})
      : assert(icon == null || customIcon == null, "Choose one only. Using icon or customIcon");
}
