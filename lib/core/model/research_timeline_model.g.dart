// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'research_timeline_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResearchTimelineModel _$ResearchTimelineModelFromJson(
        Map<String, dynamic> json) =>
    ResearchTimelineModel(
      foto: json['foto'] as String?,
      judul: json['judul'] as String?,
      nama: json['nama'] as String?,
      angkatan: json['angkatan'] as String?,
      nim: json['nim'] as String?,
      topik: json['topik'] as String?,
      pembimbing1: json['pembimbing1'] as String?,
      pembimbing2: json['pembimbing2'] as String?,
      proposalSubmissionDate: json['tglPengajuanProposal'] as String?,
      proposalVerifDate: json['tglVerifikasiUjianProposal'] as String?,
      proposalSubmissionStat: json['statusPengajuanProposal'] as String?,
      proposalUploadDate: json['tglUploadProposal'] as String?,
      eligibilityProposal: json['verifikasiKelayakanKroposal'] as String?,
      eligibilityVerifDate: json['tglVerifikasiKelayakanProposal'] as String?,
      proposalTestVerif: json['verifikasiUjianProposal'] as String?,
      proposalTestStat: json['statusUjianProposal'] as String?,
      proposalRevVerif: json['verifikasiRevisiProposal'] as String?,
      proposalRevVerifDate: json['tglVerifikasiRevisiProposal'] as String?,
      preThesisUpDate: json['tglUploadPratesis'] as String?,
      preThesisEligVerif: json['verifikasiPratesisKelayakan'] as String?,
      preThesisEligVerifDate: json['tglVerifikasiPratesisKelayakan'] as String?,
      preThesisTestStat: json['statusPratesisUjian'] as String?,
      preThesisTestStatDate: json['tglStatusPratesisUjian'] as String?,
      preThesisRevStat: json['statusPratesisPevisi'] as String?,
      tglStatusPratesisPevisi: json['tglStatusPratesisPevisi'] as String?,
      tglTesisUpload: json['tglTesisUpload'] as String?,
      verifikasiTesisKelayakan: json['verifikasiTesisKelayakan'] as String?,
      tglVerifikasiTesisKelayakan:
          json['tglVerifikasiTesisKelayakan'] as String?,
      tglTesisUjian: json['tglTesisUjian'] as String?,
      statusTesisUjian: json['statusTesisUjian'] as String?,
      verifikasiTesisRevisi: json['verifikasiTesisRevisi'] as String?,
      tahapPenelitian: json['tahapPenelitian'] as String?,
      statusPenelitian: json['statusPenelitian'] as String?,
    );

Map<String, dynamic> _$ResearchTimelineModelToJson(
        ResearchTimelineModel instance) =>
    <String, dynamic>{
      'foto': instance.foto,
      'judul': instance.judul,
      'nama': instance.nama,
      'angkatan': instance.angkatan,
      'nim': instance.nim,
      'topik': instance.topik,
      'pembimbing1': instance.pembimbing1,
      'pembimbing2': instance.pembimbing2,
      'tglPengajuanProposal': instance.proposalSubmissionDate,
      'tglVerifikasiUjianProposal': instance.proposalVerifDate,
      'statusPengajuanProposal': instance.proposalSubmissionStat,
      'tglUploadProposal': instance.proposalUploadDate,
      'verifikasiKelayakanKroposal': instance.eligibilityProposal,
      'tglVerifikasiKelayakanProposal': instance.eligibilityVerifDate,
      'verifikasiUjianProposal': instance.proposalTestVerif,
      'statusUjianProposal': instance.proposalTestStat,
      'verifikasiRevisiProposal': instance.proposalRevVerif,
      'tglVerifikasiRevisiProposal': instance.proposalRevVerifDate,
      'tglUploadPratesis': instance.preThesisUpDate,
      'verifikasiPratesisKelayakan': instance.preThesisEligVerif,
      'tglVerifikasiPratesisKelayakan': instance.preThesisEligVerifDate,
      'statusPratesisUjian': instance.preThesisTestStat,
      'tglStatusPratesisUjian': instance.preThesisTestStatDate,
      'statusPratesisPevisi': instance.preThesisRevStat,
      'tglStatusPratesisPevisi': instance.tglStatusPratesisPevisi,
      'tglTesisUpload': instance.tglTesisUpload,
      'verifikasiTesisKelayakan': instance.verifikasiTesisKelayakan,
      'tglVerifikasiTesisKelayakan': instance.tglVerifikasiTesisKelayakan,
      'tglTesisUjian': instance.tglTesisUjian,
      'statusTesisUjian': instance.statusTesisUjian,
      'verifikasiTesisRevisi': instance.verifikasiTesisRevisi,
      'tahapPenelitian': instance.tahapPenelitian,
      'statusPenelitian': instance.statusPenelitian,
    };
