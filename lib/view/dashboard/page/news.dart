import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siskangv2/components/in_page_search_bar.dart';
import 'package:siskangv2/core/common/links.dart';
import 'package:siskangv2/core/controller/news_controller.dart';
import 'package:siskangv2/core/model/news_model.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/view/dashboard/widget/berita_terkini.dart';
import 'package:siskangv2/view/dashboard/widget/news_card.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  String? _searchQuery;
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
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
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: GetBuilder<NewsController>(builder: (news) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
                  child: InPageSearchBar(
                    hint: "Cari Berita",
                    focusNode: _focusNode,
                    onSubmitted: (p0) {
                      _focusNode.unfocus();
                    },
                    searchQuery: (p0) {
                      setState(() {
                        _searchQuery = p0;
                      });
                    },
                  ),
                ),
                if (_searchQuery == null || _searchQuery!.isBlank!) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    child: Text(
                      "Berita Terbaru",
                      style: Get.textTheme.headline4!
                          .copyWith(fontWeight: FontWeight.bold, color: Pallete.black),
                    ),
                  ),
                  CarouselSlider(
                    items: List.generate(
                        news.primeNews.length >= 5 ? 5 : news.primeNews.length,
                        (index) => GestureDetector(
                              onTap: () => Get.toNamed('/news/detail',
                                  arguments: news.primeNews[index].idBerita),
                              child: BeritaTerkini(
                                date: dateToString(
                                    date: stringToDate(date: news.primeNews[index].tglBerita!),
                                    format: "dd MMMM yyyy"),
                                title: news.primeNews[index].judulBerita!,
                                image: NetworkImage(news.primeNews[index].fotoBerita!),
                              ),
                            )),
                    options: CarouselOptions(
                      height: 170.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    child: Text(
                      "Berita Lainnya",
                      style: Get.textTheme.headline4!
                          .copyWith(fontWeight: FontWeight.bold, color: Pallete.black),
                    ),
                  ),
                  _listedNews(news.restNews)
                ] else ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    child: Text(
                      "Hasil Pencarian",
                      style: Get.textTheme.headline4!
                          .copyWith(fontWeight: FontWeight.bold, color: Pallete.black),
                    ),
                  ),
                  _listedNews(news.primeNews
                      .where(
                          (e) => e.judulBerita!.toLowerCase().contains(_searchQuery!.toLowerCase()))
                      .toList()),
                  _listedNews(news.restNews
                      .where(
                          (e) => e.judulBerita!.toLowerCase().contains(_searchQuery!.toLowerCase()))
                      .toList()),
                ]
              ],
            ),
          );
        }),
      ),
    ));
  }

  Widget _listedNews(List<NewsModel> news) {
    return GestureDetector(
      onPanDown: (details) => _focusNode.unfocus(),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: news.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Get.toNamed('/news/detail', arguments: news[index].idBerita),
                  child: NewsCard(
                    data: news[index],
                  ),
                ),
                const Divider(
                  thickness: 2,
                  color: Pallete.lightGrey,
                )
              ],
            )),
      ),
    );
  }
}
