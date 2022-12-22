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
      type: _parseNotifType(json['jenisPesan']),
      success: json['sukses'] as String?,
      failed: json['gagal'] as String?,
      calon: json['calon'] as String?,
      isRead:
          json['is_read'] == null ? false : _parseReadStatus(json['is_read']),
    );

Map<String, dynamic> _$NotifModelToJson(NotifModel instance) =>
    <String, dynamic>{
      'idPesan': instance.id,
      'idDetail': instance.idDetail,
      'judul': instance.title,
      'isi': instance.message,
      'tglKirim': instance.date,
      'jenisPesan': _$NotificationTypeEnumMap[instance.type],
      'sukses': instance.success,
      'gagal': instance.failed,
      'calon': instance.calon,
      'is_read': instance.isRead,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.POST_NOTIF: 'POST_NOTIF',
  NotificationType.PROPOSAL_SCHEDULE_NOTIF: 'PROPOSAL_SCHEDULE_NOTIF',
  NotificationType.PRATHESIS_NOTIF: 'PRATHESIS_NOTIF',
  NotificationType.THESIS_TEST_NOTIF: 'THESIS_TEST_NOTIF',
};
