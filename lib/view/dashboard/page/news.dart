import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:siskangv2/core/controller/news_controller.dart';
import 'package:siskangv2/themes/asset_dir.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/view/dashboard/widget/news_card.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

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
        child: GetBuilder<NewsController>(builder: (news) {
          return ListView.builder(
            itemCount: news.news.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          Get.toNamed('/news/detail', arguments: news.news[index].idBerita),
                      child: NewsCard(
                        data: news.news[index],
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                      color: Pallete.lightGrey,
                    )
                  ],
                )),
          );
        }),
      ),
    ));
  }

  // List<Map<String, String>> _dummyData() {
  //   return [
  //     {
  //       "image": "asset/images/logo.png",
  //       "title": "Sed euismod consectetur sapien, nec mattis lacus lacinia.",
  //       "subtitle":
  //           "Maecenas vitae risus eget nisl malesuada efficitur sit amet sit amet odio. Ut ultricies feugiat."
  //     },
  //     {
  //       "image": "asset/images/logo.png",
  //       "title": "Sed euismod consectetur sapien, nec mattis lacus lacinia.",
  //       "subtitle":
  //           "Maecenas vitae risus eget nisl malesuada efficitur sit amet sit amet odio. Ut ultricies feugiat."
  //     },
  //     {
  //       "image": "asset/images/logo.png",
  //       "title": "Sed euismod consectetur sapien, nec mattis lacus lacinia.",
  //       "subtitle":
  //           "Maecenas vitae risus eget nisl malesuada efficitur sit amet sit amet odio. Ut ultricies feugiat."
  //     },
  //     {
  //       "image": "asset/images/logo.png",
  //       "title": "Sed euismod consectetur sapien, nec mattis lacus lacinia.",
  //       "subtitle":
  //           "Maecenas vitae risus eget nisl malesuada efficitur sit amet sit amet odio. Ut ultricies feugiat."
  //     },
  //     {
  //       "image": "asset/images/logo.png",
  //       "title": "Sed euismod consectetur sapien, nec mattis lacus lacinia.",
  //       "subtitle":
  //           "Maecenas vitae risus eget nisl malesuada efficitur sit amet sit amet odio. Ut ultricies feugiat."
  //     },
  //     {
  //       "image": "asset/images/logo.png",
  //       "title": "Sed euismod consectetur sapien, nec mattis lacus lacinia.",
  //       "subtitle":
  //           "Maecenas vitae risus eget nisl malesuada efficitur sit amet sit amet odio. Ut ultricies feugiat."
  //     }
  //   ];
  // }
}
