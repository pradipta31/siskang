// ignore_for_file: deprecated_member_use

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:siskangv2/core/controller/news_controller.dart';
import 'package:siskangv2/core/model/news_model.dart';
import 'package:siskangv2/themes/asset_dir.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/view/misc/image_viewer.dart';

class NewsDetail extends StatelessWidget {
  const NewsDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String newsId = Get.arguments;
    final news = Get.find<NewsController>();
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          backgroundColor: Pallete.primaryLight,
          titleSpacing: 8,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Berita Terkini",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Get.textTheme.headline4
                  ?.copyWith(color: Pallete.white, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: FutureBuilder<NewsModel>(
                future: news.getNewsById(idNews: newsId),
                builder: (context, snapshot) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) ...[
                      GestureDetector(
                        onTap: () => Get.to(() => ImageViewer(
                            tag: snapshot.data!.idBerita!,
                            image: NetworkImage(snapshot.data!.fotoBerita!),
                            newsTitle: snapshot.data!.judulBerita!)),
                        child: Stack(
                          children: [
                            Hero(
                                tag: snapshot.data!.idBerita!,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16)),
                                  child: Image.network(
                                    snapshot.data!.fotoBerita!,
                                    errorBuilder: (context, error, stackTrace) =>
                                        Image.asset("/asset/images/logo_undiksha.png"),
                                    fit: BoxFit.cover,
                                    width: Get.width,
                                    height: 200,
                                    alignment: Alignment.topCenter,
                                  ),
                                )),
                            Positioned(
                              left: 8,
                              bottom: 8,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Pallete.black.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.fullscreen_rounded,
                                        size: 14,
                                        color: Pallete.white,
                                      ),
                                      Text("Perbesar",
                                          style: Get.textTheme.bodyText2!.copyWith(
                                            color: Pallete.white,
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              fit: FlexFit.loose,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    snapshot.data!.judulBerita!,
                                    maxLines: 3,
                                    stepGranularity: 2.0,
                                    minFontSize: 14,
                                    overflow: TextOverflow.ellipsis,
                                    style: Get.textTheme.headline4?.copyWith(
                                        fontWeight: FontWeight.w900, color: Pallete.black),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          AssetsDirectory.calendarLines,
                                          width: 14,
                                          height: 14,
                                          fit: BoxFit.fill,
                                          color: Pallete.darkGrey,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: AutoSizeText(
                                            snapshot.data!.tglBerita!,
                                            maxLines: 1,
                                            stepGranularity: 2.0,
                                            minFontSize: 10,
                                            overflow: TextOverflow.ellipsis,
                                            style: Get.textTheme.bodyText2!
                                                .copyWith(color: Pallete.darkGrey),
                                          ),
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
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Divider(
                          color: Pallete.darkGrey,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: SelectableText(
                          parse(snapshot.data!.detailBerita!).documentElement!.text,
                          style: Get.textTheme.bodyText1!.copyWith(color: Pallete.black),
                        ),
                      )
                    ]
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
