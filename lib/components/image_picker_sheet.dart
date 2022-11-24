import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siskangv2/themes/color_pallete.dart';

// ignore: must_be_immutable
class ImagePickerSheet extends StatelessWidget {
  BoolCallback? stats;
  ImagePickerSheet({this.stats});
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      expand: false,
      snap: true,
      builder: (context, scrollController) => Container(
        color: Pallete.activeColor,
        width: Get.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Ambil gambar menggunakan",
                style: Get.textTheme.headline5!.copyWith(color: Pallete.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    splashColor: Pallete.lightGrey,
                    onTap: () {
                      stats!(true);
                      Get.back();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.camera_alt_rounded,
                          size: 28,
                          color: Pallete.primaryLight,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Kamera",
                          style: Get.textTheme.bodyText1,
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    splashColor: Pallete.lightGrey,
                    onTap: () {
                      stats!(false);
                      Get.back();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.photo,
                          size: 28,
                          color: Pallete.primaryLight,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Galeri",
                          style: Get.textTheme.bodyText1,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

typedef void BoolCallback(bool response);
