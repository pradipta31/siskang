import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:siskangv2/themes/color_pallete.dart';

class ImageViewer extends StatelessWidget {
  final String tag, newsTitle;
  final ImageProvider image;
  const ImageViewer({Key? key, required this.tag, required this.image, required this.newsTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.black.withOpacity(0.1),
        titleSpacing: 8,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            newsTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Get.textTheme.headline4
                ?.copyWith(color: Pallete.white, fontWeight: FontWeight.w700),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back,
              size: 24,
              color: Pallete.white,
            ),
          ),
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: PhotoView(
          imageProvider: image,
          heroAttributes: PhotoViewHeroAttributes(tag: tag),
        ),
      ),
    );
  }
}
