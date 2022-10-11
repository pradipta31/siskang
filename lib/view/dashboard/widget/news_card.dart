import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:siskangv2/core/common/links.dart';
import 'package:siskangv2/core/model/news_model.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:html/parser.dart';

class NewsCard extends StatelessWidget {
  final NewsModel data;
  const NewsCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: ClipOval(
            child: SizedBox.fromSize(
              size: const Size.fromRadius(20),
              child: Image.network(
                data.fotoBerita!,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Flexible(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              data.judulBerita!,
              style: Get.textTheme.headline6
                  ?.copyWith(fontWeight: FontWeight.bold, color: Pallete.black),
            ),
            Text(
              parse(data.detailBerita!).documentElement!.text,
              style: Get.textTheme.bodyText1?.copyWith(color: Pallete.darkGrey),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ))
      ],
    );
  }
}
