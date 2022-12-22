import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:siskangv2/core/controller/auth_controller.dart';
import 'package:siskangv2/core/controller/news_controller.dart';
import 'package:siskangv2/core/controller/notif_controller.dart';
import 'package:siskangv2/core/controller/research_controller.dart';
import 'package:siskangv2/themes/asset_dir.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/view/dashboard/page/account.dart';
import 'package:siskangv2/view/dashboard/page/dashboard.dart';
import 'package:siskangv2/view/dashboard/page/news.dart';
import 'package:siskangv2/view/dashboard/page/research.dart';
import 'package:siskangv2/view/dashboard/page/schedule.dart';
import 'package:siskangv2/view/dashboard/widget/bottom_nav_bar.dart';

class MainDashboard extends StatefulWidget {
  final _authController = Get.find<AuthController>();
  final _researchController = Get.find<ResearchController>();
  final _newsController = Get.find<NewsController>();
  final _notifController = Get.find<NotifController>();
  MainDashboard({Key? key}) : super(key: key);

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        children: const [MasterPage(), SchedulePage(), News(), Research(), Account()],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        itemColor: const Color(0xff27487f),
        onChange: (index) {
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
        },
        children: [
          CustomBottomNavigationItem(
            label: "Home",
            customIcon: AssetsDirectory.apps,
          ),
          CustomBottomNavigationItem(
            label: "Home",
            customIcon: AssetsDirectory.graduationCap,
          ),
          CustomBottomNavigationItem(
            label: "Home",
            customIcon: AssetsDirectory.bookOpen,
          ),
          CustomBottomNavigationItem(
            label: "Home",
            customIcon: AssetsDirectory.bookCloed,
          ),
          CustomBottomNavigationItem(
            label: "Home",
            customIcon: AssetsDirectory.user,
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Pallete.primaryLight, statusBarIconBrightness: Brightness.light));

    _pageController = PageController();
    widget._researchController.getMasaStudi(
        prodiId: widget._authController.userData!.prodiId!,
        nim: widget._authController.userData!.nim!,
        jabatan: widget._authController.userData!.jabatan!);

    widget._researchController.getResearchTimelineByNim(nim: widget._authController.userData!.nim!);
    widget._newsController.getNews(idProdi: widget._authController.userData!.prodiId!);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
