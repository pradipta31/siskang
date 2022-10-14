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
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  AssetsDirectory.search,
                  color: Pallete.white,
                ),
              ),
            )
          ],
        ),
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: FutureBuilder<NewsModel>(
                future: news.getNewsById(idNews: newsId),
                builder: (context, snapshot) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: ClipOval(
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(20),
                                  child: Image.network(
                                    snapshot.data!.fotoBerita!,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
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
                                          color: Pallete.lightGrey,
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
                                                .copyWith(color: Pallete.lightGrey),
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
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 24, left: 8, right: 8),
                          child: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Pallete.darkGrey.withOpacity(0.16),
                                  blurRadius: 2,
                                  offset: const Offset(0, 3),
                                  spreadRadius: 4)
                            ]),
                            child: GestureDetector(
                              onTap: () => Get.to(() => ImageViewer(
                                  tag: snapshot.data!.idBerita!,
                                  image: NetworkImage(snapshot.data!.fotoBerita!),
                                  newsTitle: snapshot.data!.judulBerita!)),
                              child: Hero(
                                  tag: snapshot.data!.idBerita!,
                                  child: Image.network(
                                    snapshot.data!.fotoBerita!,
                                    fit: BoxFit.cover,
                                    width: Get.width,
                                    height: 200,
                                    alignment: Alignment.topCenter,
                                  )),
                            ),
                          ),
                        ),
                        SelectableText(
                          parse(snapshot.data!.detailBerita!).documentElement!.text,
                          style: Get.textTheme.bodyText1,
                        )
                      ]
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
