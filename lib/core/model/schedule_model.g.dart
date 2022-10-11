// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleModel _$ScheduleModelFromJson(Map<String, dynamic> json) =>
    ScheduleModel(
      idJadwal: json['idJadwal'] as String?,
      jenisUjian: json['jenisUjian'] as String?,
      nama: json['nama'] as String?,
      nim: json['nim'] as String?,
      fotoMhs: json['fotoMhs'] as String?,
      topik: json['topik'] as String?,
      judul: json['judul'] as String?,
      pembimbing1: json['pembimbing1'] as String?,
      pembimbing2: json['pembimbing2'] as String?,
      penguji1: json['penguji1'] as String?,
      penguji2: json['penguji2'] as String?,
      ruangan: json['ruangan'] as String?,
      tgl: json['tgl'] as String?,
      waktuMulai: json['waktuMulai'] as String?,
      waktuSelesai: json['waktuSelesai'] as String?,
    );

Map<String, dynamic> _$ScheduleModelToJson(ScheduleModel instance) =>
    <String, dynamic>{
      'idJadwal': instance.idJadwal,
      'jenisUjian': instance.jenisUjian,
      'nama': instance.nama,
      'nim': instance.nim,
      'fotoMhs': instance.fotoMhs,
      'topik': instance.topik,
      'judul': instance.judul,
      'pembimbing1': instance.pembimbing1,
      'pembimbing2': instance.pembimbing2,
      'penguji1': instance.penguji1,
      'penguji2': instance.penguji2,
      'ruangan': instance.ruangan,
      'tgl': instance.tgl,
      'waktuMulai': instance.waktuMulai,
      'waktuSelesai': instance.waktuSelesai,
    };
