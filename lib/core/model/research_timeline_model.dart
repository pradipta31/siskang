import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'research_timeline_model.g.dart';

@JsonSerializable()
class ResearchTimelineModel {
  String? foto;
  String? judul;
  String? nama;
  String? angkatan;
  String? nim;
  String? topik;
  String? pembimbing1;
  String? pembimbing2;
  @JsonKey(name: "tglPengajuanProposal")
  String? proposalSubmissionDate;
  @JsonKey(name: "tglVerifikasiUjianProposal")
  String? proposalVerifDate;
  @JsonKey(name: "statusPengajuanProposal")
  String? proposalSubmissionStat;
  @JsonKey(name: "tglUploadProposal")
  String? proposalUploadDate;
  @JsonKey(name: "verifikasiKelayakanKroposal")
  String? eligibilityProposal;
  @JsonKey(name: "tglVerifikasiKelayakanProposal")
  String? eligibilityVerifDate;
  @JsonKey(name: "verifikasiUjianProposal")
  String? proposalTestVerif;
  @JsonKey(name: "statusUjianProposal")
  String? proposalTestStat;
  @JsonKey(name: "verifikasiRevisiProposal")
  String? proposalRevVerif;
  @JsonKey(name: "tglVerifikasiRevisiProposal")
  String? proposalRevVerifDate;
  @JsonKey(name: "tglUploadPratesis")
  String? preThesisUpDate;
  @JsonKey(name: "verifikasiPratesisKelayakan")
  String? preThesisEligVerif;
  @JsonKey(name: "tglVerifikasiPratesisKelayakan")
  String? preThesisEligVerifDate;
  @JsonKey(name: "statusPratesisUjian")
  String? preThesisTestStat;
  @JsonKey(name: "tglStatusPratesisUjian")
  String? preThesisTestStatDate;
  @JsonKey(name: "statusPratesisPevisi")
  String? preThesisRevStat;
  String? tglStatusPratesisPevisi;
  String? tglTesisUpload;
  String? verifikasiTesisKelayakan;
  String? tglVerifikasiTesisKelayakan;
  String? tglTesisUjian;
  String? statusTesisUjian;
  String? verifikasiTesisRevisi;
  String? tahapPenelitian;
  String? statusPenelitian;
  @JsonKey(ignore: true)
  Map<String, dynamic>? listedTimeline;
  ResearchTimelineModel({
    this.foto,
    this.judul,
    this.nama,
    this.angkatan,
    this.nim,
    this.topik,
    this.pembimbing1,
    this.pembimbing2,
    this.proposalSubmissionDate,
    this.proposalVerifDate,
    this.proposalSubmissionStat,
    this.proposalUploadDate,
    this.eligibilityProposal,
    this.eligibilityVerifDate,
    this.proposalTestVerif,
    this.proposalTestStat,
    this.proposalRevVerif,
    this.proposalRevVerifDate,
    this.preThesisUpDate,
    this.preThesisEligVerif,
    this.preThesisEligVerifDate,
    this.preThesisTestStat,
    this.preThesisTestStatDate,
    this.preThesisRevStat,
    this.tglStatusPratesisPevisi,
    this.tglTesisUpload,
    this.verifikasiTesisKelayakan,
    this.tglVerifikasiTesisKelayakan,
    this.tglTesisUjian,
    this.statusTesisUjian,
    this.verifikasiTesisRevisi,
    this.tahapPenelitian,
    this.statusPenelitian,
    this.listedTimeline,
  });

  ResearchTimelineModel copyWith({
    String? foto,
    String? judul,
    String? nama,
    String? angkatan,
    String? nim,
    String? topik,
    String? pembimbing1,
    String? pembimbing2,
    String? proposalSubmissionDate,
    String? proposalVerifDate,
    String? proposalSubmissionStat,
    String? proposalUploadDate,
    String? eligibilityProposal,
    String? eligibilityVerifDate,
    String? proposalTestVerif,
    String? proposalTestStat,
    String? proposalRevVerif,
    String? proposalRevVerifDate,
    String? preThesisUpDate,
    String? preThesisEligVerif,
    String? preThesisEligVerifDate,
    String? preThesisTestStat,
    String? preThesisTestStatDate,
    String? preThesisRevStat,
    String? tglStatusPratesisPevisi,
    String? tglTesisUpload,
    String? verifikasiTesisKelayakan,
    String? tglVerifikasiTesisKelayakan,
    String? tglTesisUjian,
    String? statusTesisUjian,
    String? verifikasiTesisRevisi,
    String? tahapPenelitian,
    String? statusPenelitian,
    Map<String, dynamic>? listedTimeline,
  }) {
    return ResearchTimelineModel(
      foto: foto ?? this.foto,
      judul: judul ?? this.judul,
      nama: nama ?? this.nama,
      angkatan: angkatan ?? this.angkatan,
      nim: nim ?? this.nim,
      topik: topik ?? this.topik,
      pembimbing1: pembimbing1 ?? this.pembimbing1,
      pembimbing2: pembimbing2 ?? this.pembimbing2,
      proposalSubmissionDate: proposalSubmissionDate ?? this.proposalSubmissionDate,
      proposalVerifDate: proposalVerifDate ?? this.proposalVerifDate,
      proposalSubmissionStat: proposalSubmissionStat ?? this.proposalSubmissionStat,
      proposalUploadDate: proposalUploadDate ?? this.proposalUploadDate,
      eligibilityProposal: eligibilityProposal ?? this.eligibilityProposal,
      eligibilityVerifDate: eligibilityVerifDate ?? this.eligibilityVerifDate,
      proposalTestVerif: proposalTestVerif ?? this.proposalTestVerif,
      proposalTestStat: proposalTestStat ?? this.proposalTestStat,
      proposalRevVerif: proposalRevVerif ?? this.proposalRevVerif,
      proposalRevVerifDate: proposalRevVerifDate ?? this.proposalRevVerifDate,
      preThesisUpDate: preThesisUpDate ?? this.preThesisUpDate,
      preThesisEligVerif: preThesisEligVerif ?? this.preThesisEligVerif,
      preThesisEligVerifDate: preThesisEligVerifDate ?? this.preThesisEligVerifDate,
      preThesisTestStat: preThesisTestStat ?? this.preThesisTestStat,
      preThesisTestStatDate: preThesisTestStatDate ?? this.preThesisTestStatDate,
      preThesisRevStat: preThesisRevStat ?? this.preThesisRevStat,
      tglStatusPratesisPevisi: tglStatusPratesisPevisi ?? this.tglStatusPratesisPevisi,
      tglTesisUpload: tglTesisUpload ?? this.tglTesisUpload,
      verifikasiTesisKelayakan: verifikasiTesisKelayakan ?? this.verifikasiTesisKelayakan,
      tglVerifikasiTesisKelayakan: tglVerifikasiTesisKelayakan ?? this.tglVerifikasiTesisKelayakan,
      tglTesisUjian: tglTesisUjian ?? this.tglTesisUjian,
      statusTesisUjian: statusTesisUjian ?? this.statusTesisUjian,
      verifikasiTesisRevisi: verifikasiTesisRevisi ?? this.verifikasiTesisRevisi,
      tahapPenelitian: tahapPenelitian ?? this.tahapPenelitian,
      statusPenelitian: statusPenelitian ?? this.statusPenelitian,
      listedTimeline: listedTimeline ?? this.listedTimeline,
    );
  }

  Map<String, dynamic> toJson() => _$ResearchTimelineModelToJson(this);

  factory ResearchTimelineModel.fromJson(Map<String, dynamic> json) =>
      _$ResearchTimelineModelFromJson(json);

  @override
  String toString() {
    return 'ResearchTimelineModel(foto: $foto, judul: $judul, nama: $nama, angkatan: $angkatan, nim: $nim, topik: $topik, pembimbing1: $pembimbing1, pembimbing2: $pembimbing2, proposalSubmissionDate: $proposalSubmissionDate, proposalVerifDate: $proposalVerifDate, proposalSubmissionStat: $proposalSubmissionStat, proposalUploadDate: $proposalUploadDate, eligibilityProposal: $eligibilityProposal, eligibilityVerifDate: $eligibilityVerifDate, proposalTestVerif: $proposalTestVerif, proposalTestStat: $proposalTestStat, proposalRevVerif: $proposalRevVerif, proposalRevVerifDate: $proposalRevVerifDate, preThesisUpDate: $preThesisUpDate, preThesisEligVerif: $preThesisEligVerif, preThesisEligVerifDate: $preThesisEligVerifDate, preThesisTestStat: $preThesisTestStat, preThesisTestStatDate: $preThesisTestStatDate, preThesisRevStat: $preThesisRevStat, tglStatusPratesisPevisi: $tglStatusPratesisPevisi, tglTesisUpload: $tglTesisUpload, verifikasiTesisKelayakan: $verifikasiTesisKelayakan, tglVerifikasiTesisKelayakan: $tglVerifikasiTesisKelayakan, tglTesisUjian: $tglTesisUjian, statusTesisUjian: $statusTesisUjian, verifikasiTesisRevisi: $verifikasiTesisRevisi, tahapPenelitian: $tahapPenelitian, statusPenelitian: $statusPenelitian, listedTimeline: $listedTimeline)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResearchTimelineModel &&
        other.foto == foto &&
        other.judul == judul &&
        other.nama == nama &&
        other.angkatan == angkatan &&
        other.nim == nim &&
        other.topik == topik &&
        other.pembimbing1 == pembimbing1 &&
        other.pembimbing2 == pembimbing2 &&
        other.proposalSubmissionDate == proposalSubmissionDate &&
        other.proposalVerifDate == proposalVerifDate &&
        other.proposalSubmissionStat == proposalSubmissionStat &&
        other.proposalUploadDate == proposalUploadDate &&
        other.eligibilityProposal == eligibilityProposal &&
        other.eligibilityVerifDate == eligibilityVerifDate &&
        other.proposalTestVerif == proposalTestVerif &&
        other.proposalTestStat == proposalTestStat &&
        other.proposalRevVerif == proposalRevVerif &&
        other.proposalRevVerifDate == proposalRevVerifDate &&
        other.preThesisUpDate == preThesisUpDate &&
        other.preThesisEligVerif == preThesisEligVerif &&
        other.preThesisEligVerifDate == preThesisEligVerifDate &&
        other.preThesisTestStat == preThesisTestStat &&
        other.preThesisTestStatDate == preThesisTestStatDate &&
        other.preThesisRevStat == preThesisRevStat &&
        other.tglStatusPratesisPevisi == tglStatusPratesisPevisi &&
        other.tglTesisUpload == tglTesisUpload &&
        other.verifikasiTesisKelayakan == verifikasiTesisKelayakan &&
        other.tglVerifikasiTesisKelayakan == tglVerifikasiTesisKelayakan &&
        other.tglTesisUjian == tglTesisUjian &&
        other.statusTesisUjian == statusTesisUjian &&
        other.verifikasiTesisRevisi == verifikasiTesisRevisi &&
        other.tahapPenelitian == tahapPenelitian &&
        other.statusPenelitian == statusPenelitian &&
        mapEquals(other.listedTimeline, listedTimeline);
  }

  @override
  int get hashCode {
    return foto.hashCode ^
        judul.hashCode ^
        nama.hashCode ^
        angkatan.hashCode ^
        nim.hashCode ^
        topik.hashCode ^
        pembimbing1.hashCode ^
        pembimbing2.hashCode ^
        proposalSubmissionDate.hashCode ^
        proposalVerifDate.hashCode ^
        proposalSubmissionStat.hashCode ^
        proposalUploadDate.hashCode ^
        eligibilityProposal.hashCode ^
        eligibilityVerifDate.hashCode ^
        proposalTestVerif.hashCode ^
        proposalTestStat.hashCode ^
        proposalRevVerif.hashCode ^
        proposalRevVerifDate.hashCode ^
        preThesisUpDate.hashCode ^
        preThesisEligVerif.hashCode ^
        preThesisEligVerifDate.hashCode ^
        preThesisTestStat.hashCode ^
        preThesisTestStatDate.hashCode ^
        preThesisRevStat.hashCode ^
        tglStatusPratesisPevisi.hashCode ^
        tglTesisUpload.hashCode ^
        verifikasiTesisKelayakan.hashCode ^
        tglVerifikasiTesisKelayakan.hashCode ^
        tglTesisUjian.hashCode ^
        statusTesisUjian.hashCode ^
        verifikasiTesisRevisi.hashCode ^
        tahapPenelitian.hashCode ^
        statusPenelitian.hashCode ^
        listedTimeline.hashCode;
  }
}
