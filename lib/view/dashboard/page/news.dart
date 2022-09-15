import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:siskangv2/themes/asset_dir.dart';
import 'package:siskangv2/themes/color_pallete.dart';

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
        child: ListView.builder(
          itemCount: _dummyData().length,
          shrinkWrap: true,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ClipOval(
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(20),
                      child: Image.asset(
                        _dummyData()[index]["image"]!,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _dummyData()[index]["title"]!,
                      style: Get.textTheme.headline6
                          ?.copyWith(fontWeight: FontWeight.bold, color: Pallete.black),
                    ),
                    Text(_dummyData()[index]["subtitle"]!,
                        style: Get.textTheme.bodyText1?.copyWith(color: Pallete.darkGrey))
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    ));
  }

  List<Map<String, String>> _dummyData() {
    return [
      {
        "image": "asset/images/logo.png",
        "title": "Sed euismod consectetur sapien, nec mattis lacus lacinia.",
        "subtitle":
            "Maecenas vitae risus eget nisl malesuada efficitur sit amet sit amet odio. Ut ultricies feugiat."
      },
      {
        "image": "asset/images/logo.png",
        "title": "Sed euismod consectetur sapien, nec mattis lacus lacinia.",
        "subtitle":
            "Maecenas vitae risus eget nisl malesuada efficitur sit amet sit amet odio. Ut ultricies feugiat."
      },
      {
        "image": "asset/images/logo.png",
        "title": "Sed euismod consectetur sapien, nec mattis lacus lacinia.",
        "subtitle":
            "Maecenas vitae risus eget nisl malesuada efficitur sit amet sit amet odio. Ut ultricies feugiat."
      },
      {
        "image": "asset/images/logo.png",
        "title": "Sed euismod consectetur sapien, nec mattis lacus lacinia.",
        "subtitle":
            "Maecenas vitae risus eget nisl malesuada efficitur sit amet sit amet odio. Ut ultricies feugiat."
      },
      {
        "image": "asset/images/logo.png",
        "title": "Sed euismod consectetur sapien, nec mattis lacus lacinia.",
        "subtitle":
            "Maecenas vitae risus eget nisl malesuada efficitur sit amet sit amet odio. Ut ultricies feugiat."
      },
      {
        "image": "asset/images/logo.png",
        "title": "Sed euismod consectetur sapien, nec mattis lacus lacinia.",
        "subtitle":
            "Maecenas vitae risus eget nisl malesuada efficitur sit amet sit amet odio. Ut ultricies feugiat."
      }
    ];
  }
}
