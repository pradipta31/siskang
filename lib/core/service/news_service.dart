import 'dart:convert';

import 'package:get/get.dart';
import 'package:siskangv2/core/common/links.dart';
import 'package:siskangv2/core/model/news_model.dart';

class NewsService extends GetConnect {
  Future<List<NewsModel>> getNewsList(FormData form) async {
    return await post(getUriEndpoint(domain, "$staticPath/getNews").toString(), form).then((value) {
      if (responseChecker(value)) {
        return List<NewsModel>.from(jsonDecode(value.body).map((e) => NewsModel.fromJson(e)));
      } else {
        throw "Error getNewsList ${value.body}";
      }
    }).catchError((e) => throw e);
  }
}
