import 'dart:collection';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:siskangv2/core/common/research_grouping_enum.dart';
import 'package:siskangv2/core/model/listed_research_timeline_model.dart';
import 'package:siskangv2/core/model/masa_studi_model.dart';
import 'package:siskangv2/core/model/research_timeline_model.dart';
import 'package:siskangv2/core/service/research_service.dart';
import 'package:collection/collection.dart';

class ResearchController extends GetxController {
  MasaStudiModel? masaStudi;
  ResearchTimelineModel? researchTimeline;
  ResearchTimelineModel? otherTimeline;
  var allResearch = <ResearchTimelineModel>[].obs;
  List<ListedResearchimelineModel> listedResearchimeline = <ListedResearchimelineModel>[];
  List<ListedResearchimelineModel> otherListedResearchimeline = <ListedResearchimelineModel>[];

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
      update();
    }).catchError((e) {
      throw e;
    });
  }

  void getOtherResearchTimelineByNim({required String nim}) async {
    await ResearchService().getResearchTimelineByNim(FormData({"nim": nim})).then((value) {
      otherTimeline = _listingTimeline(value);
      otherListedResearchimeline.clear();
      otherTimeline!.listedTimeline!.forEach((key, value) {
        otherListedResearchimeline.add(ListedResearchimelineModel.fromJson(value));
      });
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

  List<ResearchTimelineModel> researchData(String? search) {
    if (search != null && search.isNotEmpty) {
      if (!search.isBlank!) {
        return allResearch.where((e) {
          if (e.judul?.toUpperCase().contains(search.toUpperCase()) ?? false) {
            return true;
          } else if (e.nama?.toUpperCase().contains(search.toUpperCase()) ?? false) {
            return true;
          } else if (e.pembimbing1?.toUpperCase().contains(search.toUpperCase()) ?? false) {
            return true;
          } else if (e.pembimbing2?.toUpperCase().contains(search.toUpperCase()) ?? false) {
            return true;
          } else {
            return false;
          }
        }).toList();
      }
    }
    return allResearch;
  }

  int lengthOfResearchList(String? search) {
    if (search != null && search.isNotEmpty) {
      if (!search.isBlank!) {
        return allResearch
            .where((e) {
              if (e.judul?.toUpperCase().contains(search.toUpperCase()) ?? false) {
                return true;
              } else if (e.nama?.toUpperCase().contains(search.toUpperCase()) ?? false) {
                return true;
              } else {
                return false;
              }
            })
            .toList()
            .length;
      }
    }
    return allResearch.length;
  }

  dynamic groupingResearchData(ResearchGrouping grouping, [bool? isPembimbing1 = true]) {
    switch (grouping) {
      case ResearchGrouping.TAHAP:
        return groupBy<ResearchTimelineModel, String>(
            allResearch, (key) => key.tahapPenelitian ?? "UNKNOWN");
      case ResearchGrouping.TOPIK:
        return _manipulateTopikPenelitian();
      case ResearchGrouping.PEMBIMBING:
        return _manipulatePembimbing(isPembimbing1!);
      default:
    }
  }

  Map<String, List<ResearchTimelineModel>> _manipulatePembimbing(bool isPembimbing1) {
    if (isPembimbing1) {
      return groupBy<ResearchTimelineModel, String>(allResearch, (key) => key.pembimbing1!);
    } else {
      return groupBy<ResearchTimelineModel, String>(allResearch, (key) => key.pembimbing2!);
    }
  }

  Map<String, int> _manipulateTopikPenelitian() {
    Map<String, int> data = {};
    Set<String> topik = HashSet<String>();

    for (var res in allResearch) {
      var parts = res.topik!.split(',');
      for (var tpk in parts) {
        topik.add(tpk.trim());
      }
    }

    for (var element in topik) {
      data = {
        ...data,
        ...{
          element: allResearch
              .where((res) => res.topik!.toLowerCase().contains(element.toLowerCase()))
              .length
        }
      };
    }

    log(data.toString());

    return data;
  }

  ResearchTimelineModel _listingTimeline(ResearchTimelineModel data) {
    data.listedTimeline = {
      "0": {
        "show": _tahapPenelitian(data.tahapPenelitian!) <= 0,
        "name": "Pengajuan Judul",
        "date": data.proposalUploadDate?.toLowerCase().startsWith('un', 0) ?? false
            ? null
            : data.proposalUploadDate,
        "status": !data.proposalUploadDate!.toLowerCase().startsWith('un', 0),
        "statusText":
            // !data.proposalUploadDate!.toLowerCase().startsWith('un', 0) ? null : 
            "Judul diterima"
      },
      "1": {
        "show": _tahapPenelitian(data.tahapPenelitian!) <= 1,
        "name": "Pengajuan Proposal",
        "date": data.proposalSubmissionDate?.toLowerCase().startsWith('un', 0) ?? false
            ? null
            : data.proposalSubmissionDate,
        "status": !data.proposalSubmissionStat!.toLowerCase().startsWith('un', 0),
        "statusText": 
        // "Lanjut ke tahap proposal"
        data.proposalSubmissionStat
      },
      "2": {
        "show": _tahapPenelitian(data.tahapPenelitian!) <= 2,
        "name": "Verifikasi Proposal",
        "date": data.proposalVerifDate?.toLowerCase().startsWith('un', 0) ?? false
            ? null
            : data.proposalVerifDate,
        "status": !data.proposalVerifDate!.toLowerCase().startsWith('un', 0),
        "statusText": 
        // "Proposal terverifikasi"
        "Proposal di Setujui"
      },
      "3": {
        "show": _tahapPenelitian(data.tahapPenelitian!) <= 2,
        "name": "Verifikasi Kelayakan Proposal",
        "date": data.eligibilityVerifDate?.toLowerCase().startsWith('un', 0) ?? false
            ? null
            : data.eligibilityVerifDate,
        "status": !data.eligibilityProposal!.toLowerCase().startsWith('un', 0),
        "statusText": data.eligibilityProposal
      },
      "4": {
        "show": _tahapPenelitian(data.tahapPenelitian!) <= 2,
        "name": "Ujian Proposal",
        "date": data.proposalVerifDate?.toLowerCase().startsWith('un', 0) ?? false
            ? null
            : data.proposalVerifDate,
        "status": !data.proposalTestVerif!.toLowerCase().startsWith('un', 0),
        "statusText": data.proposalTestVerif
      },
      "5": {
        "show": _tahapPenelitian(data.tahapPenelitian!) <= 2,
        "name": "Revisi Proposal",
        "date": data.proposalRevVerifDate?.toLowerCase().startsWith('un', 0) ?? false
            ? null
            : data.proposalRevVerifDate,
        "status": !data.proposalRevVerif!.toLowerCase().startsWith('un', 0),
        "statusText": data.proposalRevVerif
      },
      "6": {
        "show": _tahapPenelitian(data.tahapPenelitian!) <= 2,
        "name": "Upload Pra Tesis",
        "date": data.preThesisUpDate?.toLowerCase().startsWith('un', 0) ?? false
            ? null
            : data.preThesisUpDate,
        "status": !data.preThesisUpDate!.toLowerCase().startsWith('un', 0),
        "statusText": data.preThesisUpDate
      },
      "7": {
        "show": _tahapPenelitian(data.tahapPenelitian!) <= 3,
        "name": "Uji Kelayakan Pra Tesis",
        "date": data.preThesisEligVerifDate?.toLowerCase().startsWith('un', 0) ?? false
            ? null
            : data.preThesisEligVerifDate,
        "status": !data.preThesisEligVerif!.toLowerCase().startsWith('un', 0),
        "statusText": data.preThesisEligVerif
      },
      "8": {
        "show": _tahapPenelitian(data.tahapPenelitian!) <= 3,
        "name": "Ujian Pra Tesis",
        "date": data.preThesisTestStatDate?.toLowerCase().startsWith('un', 0) ?? false
            ? null
            : data.preThesisTestStatDate,
        "status": !data.preThesisTestStat!.toLowerCase().startsWith('un', 0),
        "statusText": data.preThesisTestStat
      },
      "9": {
        "show": _tahapPenelitian(data.tahapPenelitian!) <= 3,
        "name": "Revisi Pra Tesis",
        "date": data.tglStatusPratesisPevisi?.toLowerCase().startsWith('un', 0) ?? false
            ? null
            : data.tglStatusPratesisPevisi,
        "status": !data.preThesisRevStat!.toLowerCase().startsWith('un', 0),
        "statusText": data.preThesisRevStat
      },
      "10": {
        "show": _tahapPenelitian(data.tahapPenelitian!) <= 4,
        "name": "Upload Tesis",
        "date": data.tglTesisUpload?.toLowerCase().startsWith('un', 0) ?? false
            ? null
            : data.tglTesisUpload,
        "status": !data.tglTesisUpload!.toLowerCase().startsWith('un', 0),
        "statusText": data.tglTesisUpload
      },
      "11": {
        "show": _tahapPenelitian(data.tahapPenelitian!) <= 4,
        "name": "Verifikasi Kelayakan Tesis",
        "date": data.tglVerifikasiTesisKelayakan?.toLowerCase().startsWith('un', 0) ?? false
            ? null
            : data.tglVerifikasiTesisKelayakan,
        "status": !data.verifikasiTesisKelayakan!.toLowerCase().startsWith('un', 0),
        "statusText": data.verifikasiTesisKelayakan
      },
      "12": {
        "show": _tahapPenelitian(data.tahapPenelitian!) <= 4,
        "name": "Ujian Tesis",
        "date": data.tglTesisUjian?.toLowerCase().startsWith('un', 0) ?? false
            ? null
            : data.tglTesisUjian,
        "status": !data.statusTesisUjian!.toLowerCase().startsWith('un', 0),
        "statusText": data.verifikasiTesisKelayakan
      },
      "13": {
        "show": _tahapPenelitian(data.tahapPenelitian!) <= 4,
        "name": "Revisi Tesis",
        "date": null,
        "status": !data.verifikasiTesisRevisi!.toLowerCase().startsWith('un', 0),
        "statusText": data.verifikasiTesisRevisi
      },
      "14": {
        "show": _tahapPenelitian(data.tahapPenelitian!) <= 5,
        "name": "Done",
        "date": null,
        "status": !data.verifikasiTesisRevisi!.toLowerCase().startsWith('un', 0),
        "statusText": data.verifikasiTesisRevisi
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
