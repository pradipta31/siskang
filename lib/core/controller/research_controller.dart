import 'dart:developer';

import 'package:get/get.dart';
import 'package:siskangv2/core/model/listed_research_timeline_model.dart';
import 'package:siskangv2/core/model/masa_studi_model.dart';
import 'package:siskangv2/core/model/research_timeline_model.dart';
import 'package:siskangv2/core/service/research_service.dart';

class ResearchController extends GetxController {
  MasaStudiModel? masaStudi;
  ResearchTimelineModel? researchTimeline;
  var allResearch = <ResearchTimelineModel>[].obs;
  List<ListedResearchimelineModel> listedResearchimeline = <ListedResearchimelineModel>[];

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

  void getResearchTimelineByNim({required String nim}) async {
    await ResearchService().getResearchTimelineByNim(FormData({"nim": nim})).then((value) {
      researchTimeline = _listingTimeline(value);
      listedResearchimeline.clear();
      researchTimeline!.listedTimeline!.forEach((key, value) {
        listedResearchimeline.add(ListedResearchimelineModel.fromJson(value));
      });
      log(listedResearchimeline
          .indexWhere((e) => e.date!.toLowerCase().startsWith('un', 0))
          .toString());
      update();
    }).catchError((e) {
      throw e;
    });
  }

  Future<List<ResearchTimelineModel>> getAllResearch({required String idProdi}) async {
    if (allResearch.isNotEmpty) {
      return allResearch;
    } else {
      return await ResearchService()
          .getAllResearch(FormData({"id_prodi": idProdi}))
          .catchError((error) {
        log(error.toString());
      }).then((value) {
        allResearch.assignAll(value);
        return allResearch;
      });
    }
  }

  ResearchTimelineModel _listingTimeline(ResearchTimelineModel data) {
    data.listedTimeline = {
      "0": {
        "show": _tahapPenelitian(data.tahapPenelitian!) <= 0,
        "name": "Upload Proposal",
        "date": data.proposalUploadDate?.toLowerCase().startsWith('un', 0) ?? false
            ? "TBD"
            : data.proposalUploadDate,
        "status": !data.proposalUploadDate!.toLowerCase().startsWith('un', 0)
      },
      "1": {
        "show": _tahapPenelitian(data.tahapPenelitian!) <= 1,
        "name": "Pengajuan Proposal",
        "date": data.proposalSubmissionDate?.toLowerCase().startsWith('un', 0) ?? false
            ? "TBD"
            : data.proposalSubmissionDate,
        "status": !data.proposalSubmissionStat!.toLowerCase().startsWith('un', 0)
      },
      "2": {
        "show": _tahapPenelitian(data.tahapPenelitian!) <= 2,
        "name": "Verifikasi Proposal",
        "date": data.proposalVerifDate?.toLowerCase().startsWith('un', 0) ?? false
            ? "TBD"
            : data.proposalVerifDate,
        "status": !data.proposalVerifDate!.toLowerCase().startsWith('un', 0)
      },
      "3": {
        "show": _tahapPenelitian(data.tahapPenelitian!) <= 2,
        "name": "Verifikasi Kelayakan Proposal",
        "date": data.eligibilityVerifDate?.toLowerCase().startsWith('un', 0) ?? false
            ? "TBD"
            : data.eligibilityVerifDate,
        "status": !data.eligibilityProposal!.toLowerCase().startsWith('un', 0)
      },
      "4": {
        "show": _tahapPenelitian(data.tahapPenelitian!) <= 2,
        "name": "Ujian Proposal",
        "date": data.proposalVerifDate?.toLowerCase().startsWith('un', 0) ?? false
            ? "TBD"
            : data.proposalVerifDate,
        "status": !data.proposalTestVerif!.toLowerCase().startsWith('un', 0)
      },
      "5": {
        "show": _tahapPenelitian(data.tahapPenelitian!) <= 2,
        "name": "Revisi Proposal",
        "date": data.proposalRevVerifDate?.toLowerCase().startsWith('un', 0) ?? false
            ? "TBD"
            : data.proposalRevVerifDate,
        "status": !data.proposalRevVerif!.toLowerCase().startsWith('un', 0)
      },
      "6": {
        "show": _tahapPenelitian(data.tahapPenelitian!) <= 2,
        "name": "Upload Pra Tesis",
        "date": data.preThesisUpDate?.toLowerCase().startsWith('un', 0) ?? false
            ? "TBD"
            : data.preThesisUpDate,
        "status": !data.preThesisUpDate!.toLowerCase().startsWith('un', 0)
      },
      "7": {
        "show": _tahapPenelitian(data.tahapPenelitian!) <= 3,
        "name": "Uji Kelayakan Pra Tesis",
        "date": data.preThesisEligVerifDate?.toLowerCase().startsWith('un', 0) ?? false
            ? "TBD"
            : data.preThesisEligVerifDate,
        "status": !data.preThesisEligVerif!.toLowerCase().startsWith('un', 0)
      },
      "8": {
        "show": _tahapPenelitian(data.tahapPenelitian!) <= 3,
        "name": "Ujian Pra Tesis",
        "date": data.preThesisTestStatDate?.toLowerCase().startsWith('un', 0) ?? false
            ? "TBD"
            : data.preThesisTestStatDate,
        "status": !data.preThesisTestStat!.toLowerCase().startsWith('un', 0)
      },
      "9": {
        "show": _tahapPenelitian(data.tahapPenelitian!) <= 3,
        "name": "Revisi Pra Tesis",
        "date": data.tglStatusPratesisPevisi?.toLowerCase().startsWith('un', 0) ?? false
            ? "TBD"
            : data.tglStatusPratesisPevisi,
        "status": !data.preThesisRevStat!.toLowerCase().startsWith('un', 0)
      },
      "10": {
        "show": _tahapPenelitian(data.tahapPenelitian!) <= 4,
        "name": "Upload Tesis",
        "date": data.tglTesisUpload?.toLowerCase().startsWith('un', 0) ?? false
            ? "TBD"
            : data.tglTesisUpload,
        "status": !data.tglTesisUpload!.toLowerCase().startsWith('un', 0)
      },
      "11": {
        "show": _tahapPenelitian(data.tahapPenelitian!) <= 4,
        "name": "Verifikasi Kelayakan Tesis",
        "date": data.tglVerifikasiTesisKelayakan?.toLowerCase().startsWith('un', 0) ?? false
            ? "TBD"
            : data.tglVerifikasiTesisKelayakan,
        "status": !data.verifikasiTesisKelayakan!.toLowerCase().startsWith('un', 0)
      },
      "12": {
        "show": _tahapPenelitian(data.tahapPenelitian!) <= 4,
        "name": "Ujian Tesis",
        "date": data.tglTesisUjian?.toLowerCase().startsWith('un', 0) ?? false
            ? "TBD"
            : data.tglTesisUjian,
        "status": !data.statusTesisUjian!.toLowerCase().startsWith('un', 0)
      },
      "13": {
        "show": _tahapPenelitian(data.tahapPenelitian!) <= 4,
        "name": "Revisi Tesis",
        "date": !data.statusTesisUjian!.toLowerCase().startsWith('un', 0)
            ? data.verifikasiTesisRevisi
            : null,
        "status": !data.verifikasiTesisRevisi!.toLowerCase().startsWith('un', 0)
      },
      "14": {
        "show": _tahapPenelitian(data.tahapPenelitian!) <= 5,
        "name": "Done",
        "date": !data.verifikasiTesisRevisi!.toLowerCase().startsWith('un', 0)
            ? data.verifikasiTesisRevisi
            : null,
        "status": !data.verifikasiTesisRevisi!.toLowerCase().startsWith('un', 0)
      },
    };
    return data;
  }

  int _tahapPenelitian(String tahap) {
    switch (tahap) {
      case "Tahap Proposal":
        return 2;
      case "Tahap Pengajuan":
        return 1;
      case "Tahap Pra Tesis":
        return 3;
      case "Tahap Tesis":
        return 4;
      case "Tahap Wisuda":
        return 5;
      default:
        return 0;
    }
  }
}
