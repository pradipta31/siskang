import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:siskangv2/themes/color_pallete.dart';

class ImagePickerPopUp extends StatelessWidget {
  double? width;
  double? height;
  List<Widget> children;
  Widget title;
  Color? bgColor;
  ImagePickerPopUp({
    Key? key,
    this.width,
    this.height,
    required this.children,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: ConstrainedBox(
        constraints: BoxConstraints(
            minHeight: 0, maxHeight: height ?? 200, maxWidth: width ?? 200, minWidth: width ?? 200),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title,
            const SizedBox(
              height: 24,
            ),
            ...children
          ],
        ),
      ),
    );
  }
}
