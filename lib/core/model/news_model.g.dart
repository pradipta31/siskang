// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
      idBerita: json['idBerita'] as String?,
      judulBerita: json['judulBerita'] as String?,
      detailBerita: json['detailBerita'] as String?,
      fotoBerita: json['fotoBerita'] as String?,
      fileBerita: json['fileBerita'] as String?,
      tglBerita: json['tglBerita'] as String?,
      statusBerita: json['statusBerita'] as String?,
    );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'idBerita': instance.idBerita,
      'judulBerita': instance.judulBerita,
      'detailBerita': instance.detailBerita,
      'fotoBerita': instance.fotoBerita,
      'fileBerita': instance.fileBerita,
      'tglBerita': instance.tglBerita,
      'statusBerita': instance.statusBerita,
    };
