import 'dart:developer';

import 'package:get/get.dart';
import 'package:siskangv2/core/model/news_model.dart';
import 'package:siskangv2/core/service/news_service.dart';

class NewsController extends GetxController {
  List<NewsModel> news = [];

  void getNews({required String idProdi}) async {
    await NewsService().getNewsList(FormData({"id_prodi": idProdi})).then((value) {
      news.assignAll(value);
    }).catchError((e) {
      log(e.toString());
    });
  }

  Future<NewsModel> getNewsById({required String idNews}) async {
    return await NewsService().getNewsById(FormData({"id_news": idNews})).catchError((e) {
      log(e.toString());
    });
  }
}
