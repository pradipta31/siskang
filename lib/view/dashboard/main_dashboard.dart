import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:siskangv2/themes/asset_dir.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/view/dashboard/page/dashboard.dart';
import 'package:siskangv2/view/dashboard/page/news.dart';
import 'package:siskangv2/view/dashboard/page/schedule.dart';
import 'package:siskangv2/view/dashboard/widget/bottom_nav_bar.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({Key? key}) : super(key: key);

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
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        children: [MasterPage(), SchedulePage(), News(), MasterPage(), MasterPage()],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        itemColor: Color(0xff27487f),
        onChange: (index) {
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
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
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Pallete.primaryLight, statusBarIconBrightness: Brightness.light));

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
