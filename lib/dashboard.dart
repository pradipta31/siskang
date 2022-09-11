import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:siskangv2/themes/asset_dir.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/widget/dashboard_menu.dart';

class MasterPage extends StatefulWidget {
  const MasterPage({Key? key}) : super(key: key);

  @override
  State<MasterPage> createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> with SingleTickerProviderStateMixin {
  late TabController controller;
  String nama = "I Gede Pradipta Adi Nugraha, S.Kom";

  @override
  void initState() {
    controller = TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Pallete.primaryLight,
          titleSpacing: 8,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Dashboard",
              style: Get.textTheme.headline4
                  ?.copyWith(color: Pallete.white, fontWeight: FontWeight.w700),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                AssetsDirectory.notification,
                color: Pallete.white,
              ),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.amber,
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Halo, $nama",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'lora'),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Selamat datang di SisKa-NG",
                          style: TextStyle(
                              fontFamily: 'lora',
                              fontSize: 14,
                              color: Color.fromRGBO(176, 190, 197, 1)),
                        )
                      ],
                    )),
                    Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      child: Text(
                        "Aktif",
                        style: TextStyle(
                            fontSize: 17.0,
                            fontFamily: 'Lora',
                            color: const Color.fromARGB(255, 226, 225, 225)),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: Container(
                      height: 150,
                      width: Get.width,
                      color: Colors.white,
                      child: Center(
                        child: GridView.count(
                          crossAxisCount: 4,
                          shrinkWrap: true,
                          crossAxisSpacing: 8,
                          children: [
                            DashboardMenu(
                              svgIcon: "",
                              menuName: "Berita",
                              height: 80,
                              buttonColor: Colors.blue,
                            ),
                            DashboardMenu(
                              svgIcon: "",
                              menuName: "Berita",
                              height: 80,
                              buttonColor: Colors.blue,
                            ),
                            DashboardMenu(
                              svgIcon: "",
                              menuName: "Berita",
                              height: 80,
                              buttonColor: Colors.blue,
                            ),
                            DashboardMenu(
                              svgIcon: "",
                              menuName: "Berita",
                              height: 80,
                              buttonColor: Colors.blue,
                            ),
                          ],
                        ),
                      )),
                ),
                Expanded(
                    child: Container(
                  color: Colors.white,
                ))
              ],
            ))
          ],
        ),
        bottomNavigationBar: Material(
          color: Color.fromARGB(255, 93, 126, 143),
          child: TabBar(
            controller: controller,
            tabs: [
              Tab(icon: Icon(Icons.sports_bar)),
              Tab(icon: Icon(Icons.sports_soccer)),
              Tab(icon: Icon(Icons.sports_mma)),
              Tab(icon: Icon(Icons.sports_tennis)),
            ],
          ),
        ),
      ),
    );
  }
}
