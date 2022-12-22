import 'package:get/get.dart';
import 'package:siskangv2/view/dashboard/main_dashboard.dart';
import 'package:siskangv2/view/graph/graph_view.dart';
import 'package:siskangv2/view/landing_page/welcome.dart';
import 'package:siskangv2/view/login/login.dart';
import 'package:siskangv2/view/news/news_detail.dart';
import 'package:siskangv2/view/notification/notification.dart';

class Pages {
  static List<GetPage<dynamic>> pages = [
    GetPage(name: '/', page: () => WelcomePage(), transition: Transition.rightToLeft),
    GetPage(name: '/dashboard', page: () => MainDashboard(), transition: Transition.rightToLeft),
    GetPage(
        name: '/news/detail', page: () => const NewsDetail(), transition: Transition.rightToLeft),
    GetPage(name: '/login', page: () => LoginPage(), transition: Transition.rightToLeft),
    GetPage(
        name: '/research/graph', page: () => const GraphView(), transition: Transition.rightToLeft),
    GetPage(
        name: '/notification', page: () => const Notification(), transition: Transition.rightToLeft)
  ];
}
