// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notif_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotifModel _$NotifModelFromJson(Map<String, dynamic> json) => NotifModel(
      id: json['idPesan'] as String?,
      idDetail: json['idDetail'] as String?,
      title: json['judul'] as String?,
      message: json['isi'] as String?,
      date: json['tglKirim'] as String?,
      type: json['jenisPesan'] as String?,
      success: json['sukses'] as String?,
      failed: json['gagal'] as String?,
      calon: json['calon'] as String?,
      isRead: json['is_read'] as String?,
    );

Map<String, dynamic> _$NotifModelToJson(NotifModel instance) =>
    <String, dynamic>{
      'idPesan': instance.id,
      'idDetail': instance.idDetail,
      'judul': instance.title,
      'isi': instance.message,
      'tglKirim': instance.date,
      'jenisPesan': instance.type,
      'sukses': instance.success,
      'gagal': instance.failed,
      'calon': instance.calon,
      'is_read': instance.isRead,
    };
