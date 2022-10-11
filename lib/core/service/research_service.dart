import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:siskangv2/core/common/links.dart';
import 'package:siskangv2/core/model/masa_studi_model.dart';
import 'package:siskangv2/core/model/research_timeline_model.dart';

class ResearchService extends GetConnect {
  Future<List<MasaStudiModel>> getMasaStudi(FormData form) async {
    return await post(getUriEndpoint(domain, "$staticPath/get_masa_studi").toString(), form)
        .then((value) {
      if (responseChecker(value)) {
        return List<MasaStudiModel>.from(
            jsonDecode(value.body).map((e) => MasaStudiModel.fromJson(e)));
        // return MasaStudiModel.fromJson(jsonDecode(value.body));
      } else {
        throw "Error getMasaStudi ${value.body}";
      }
    }).catchError((error) => throw error);
  }

  Future<ResearchTimelineModel> getResearchTimelineByNim(FormData form) async {
    return await post(
            getUriEndpoint(domain, "$staticPath/get_timeline_penelitian_by_nim").toString(), form)
        .then((value) {
      log(value.body.toString());
      if (responseChecker(value)) {
        return List<ResearchTimelineModel>.from(
            jsonDecode(value.body).map((e) => ResearchTimelineModel.fromJson(e))).first;
      } else {
        throw "Error getResearchTimelineByNim ${value.body}";
      }
    });
  }
}
