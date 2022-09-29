import 'package:get/get.dart';
import 'package:siskangv2/view/dashboard/main_dashboard.dart';
import 'package:siskangv2/view/landing_page/welcome.dart';

class Pages {
  static List<GetPage<dynamic>> pages = [
    GetPage(name: '/', page: () => WelcomePage(), transition: Transition.rightToLeft),
    GetPage(name: '/dashboard', page: () => MainDashboard(), transition: Transition.rightToLeft)
  ];
}
