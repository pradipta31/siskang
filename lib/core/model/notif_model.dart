import 'package:json_annotation/json_annotation.dart';

import 'package:siskangv2/core/common/notification_type_enum.dart';

part 'notif_model.g.dart';

@JsonSerializable()
class NotifModel {
  @JsonKey(name: "idPesan")
  String? id;
  String? idDetail;
  @JsonKey(name: "judul")
  String? title;
  @JsonKey(name: "isi")
  String? message;
  @JsonKey(name: "tglKirim")
  String? date;
  @JsonKey(name: "jenisPesan", fromJson: _parseNotifType)
  NotificationType? type;
  @JsonKey(name: "sukses")
  String? success;
  @JsonKey(name: "gagal")
  String? failed;
  String? calon;
  @JsonKey(name: "is_read", fromJson: _parseReadStatus)
  bool isRead;
  NotifModel({
    this.id,
    this.idDetail,
    this.title,
    this.message,
    this.date,
    this.type,
    this.success,
    this.failed,
    this.calon,
    this.isRead = false,
  });

  NotifModel copyWith({
    String? id,
    String? idDetail,
    String? title,
    String? message,
    String? date,
    NotificationType? type,
    String? success,
    String? failed,
    String? calon,
    bool? isRead,
  }) {
    return NotifModel(
      id: id ?? this.id,
      idDetail: idDetail ?? this.idDetail,
      title: title ?? this.title,
      message: message ?? this.message,
      date: date ?? this.date,
      type: type ?? this.type,
      success: success ?? this.success,
      failed: failed ?? this.failed,
      calon: calon ?? this.calon,
      isRead: isRead ?? this.isRead,
    );
  }

  Map<String, dynamic> toJson() => _$NotifModelToJson(this);

  factory NotifModel.fromMap(Map<String, dynamic> json) => _$NotifModelFromJson(json);

  @override
  String toString() {
    return 'NotifModel(id: $id, idDetail: $idDetail, title: $title, message: $message, date: $date, type: $type, success: $success, failed: $failed, calon: $calon, isRead: $isRead)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NotifModel &&
        other.id == id &&
        other.idDetail == idDetail &&
        other.title == title &&
        other.message == message &&
        other.date == date &&
        other.type == type &&
        other.success == success &&
        other.failed == failed &&
        other.calon == calon &&
        other.isRead == isRead;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        idDetail.hashCode ^
        title.hashCode ^
        message.hashCode ^
        date.hashCode ^
        type.hashCode ^
        success.hashCode ^
        failed.hashCode ^
        calon.hashCode ^
        isRead.hashCode;
  }
}

NotificationType _parseNotifType(_) {
  return NotificationType.values.elementAt(int.parse(_) - 1);
}

bool _parseReadStatus(_) {
  if (_ == "1") {
    return true;
  }
  return false;
}
