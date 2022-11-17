import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siskangv2/components/badge.dart';
import 'package:siskangv2/core/common/links.dart';
import 'package:siskangv2/core/model/news_model.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:html/parser.dart';

class NewsCard extends StatelessWidget {
  final NewsModel data;
  const NewsCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            height: 90,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                data.fotoBerita!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Flexible(
              fit: FlexFit.loose,
              child: SizedBox(
                height: 90,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.judulBerita!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Get.textTheme.headline6
                              ?.copyWith(fontWeight: FontWeight.bold, color: Pallete.black),
                        ),
                        Text(
                          dateToString(
                              date: stringToDate(date: data.tglBerita!), format: "dd MMMM yyyy"),
                          style: Get.textTheme.bodyText1?.copyWith(color: Pallete.darkGrey),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Badge(
                          colorBadge: Colors.blue[700],
                          titleBadge: 'Berita',
                          iconBadge: const Icon(
                            Icons.check_circle,
                            size: 13,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Lihat Detail",
                              style: Get.textTheme.bodyText1?.copyWith(color: Pallete.primaryLight),
                            ),
                            const Center(
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 18,
                                color: Pallete.primaryLight,
                              ),
                            )
                          ],
                        )
                      ],
                    )
                    // Text(
                    //   parse(data.detailBerita!).documentElement!.text,
                    //   style: Get.textTheme.bodyText1?.copyWith(color: Pallete.darkGrey),
                    //   maxLines: 3,
                    //   overflow: TextOverflow.ellipsis,
                    // )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
