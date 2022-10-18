// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'masa_studi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MasaStudiModel _$MasaStudiModelFromJson(Map<String, dynamic> json) =>
    MasaStudiModel(
      startStudy: json['tglAwalStudi'] as String?,
      endStudy: json['tglAkhirStudi'] as String?,
      remainingStudy: json['sisaMasaStudi'] as String?,
      nim: json['Nim'] as String?,
      researchStats: json['status_penelitian'] as String?,
      email: json['Email'] as String?,
      phone: json['no_telp'] as String?,
      photo: json['Foto'] as String?,
      status: json['Status'] as String?,
      name: json['Nama'] as String?,
    );

Map<String, dynamic> _$MasaStudiModelToJson(MasaStudiModel instance) =>
    <String, dynamic>{
      'tglAwalStudi': instance.startStudy,
      'tglAkhirStudi': instance.endStudy,
      'sisaMasaStudi': instance.remainingStudy,
      'Nim': instance.nim,
      'status_penelitian': instance.researchStats,
      'Email': instance.email,
      'no_telp': instance.phone,
      'Foto': instance.photo,
      'Status': instance.status,
      'Nama': instance.name,
    };
