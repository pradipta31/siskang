import 'dart:developer';

import 'package:get/get.dart';
import 'package:siskangv2/core/model/news_model.dart';
import 'package:siskangv2/core/service/news_service.dart';

class NewsController extends GetxController {
  List<NewsModel> primeNews = [];
  List<NewsModel> restNews = [];

  void getNews({required String idProdi}) async {
    await NewsService().getNewsList(FormData({"id_prodi": idProdi})).then((value) {
      if (value.length >= 5) {
        restNews.assignAll(value);
        primeNews.assignAll(value.take(5));
        restNews.removeRange(0, 5);
      } else if (value.isNotEmpty && value.length < 5) {
        primeNews.assignAll(value);
      }
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
