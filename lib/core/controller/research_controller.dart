import 'dart:developer';

import 'package:get/get.dart';
import 'package:siskangv2/core/model/masa_studi_model.dart';
import 'package:siskangv2/core/service/research_service.dart';

class ResearchController extends GetxController {
  MasaStudiModel? masaStudi;

  void getMasaStudi({required String prodiId, required String nim, required String jabatan}) async {
    await ResearchService()
        .getMasaStudi(FormData({"id_prodi": prodiId, "nim": nim, "jabatan": jabatan}))
        .then((value) {
      masaStudi = value.singleWhere((e) => e.nim == nim);
      update();
    }).catchError((error) {
      throw error;
    });
  }
}
