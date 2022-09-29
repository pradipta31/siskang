import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'masa_studi_model.g.dart';

@JsonSerializable()
class MasaStudiModel {
  @JsonKey(name: "tglAwalStudi")
  String? startStudy;
  @JsonKey(name: "tglAkhirStudi")
  String? endStudy;
  @JsonKey(name: "sisaMasaStudy")
  String? remainingStudy;
  @JsonKey(name: "Nim")
  String? nim;
  @JsonKey(name: "status_penelitian")
  String? researchStats;
  @JsonKey(name: "Email")
  String? email;
  @JsonKey(name: "no_telp")
  String? phone;
  @JsonKey(name: "Foto")
  String? photo;
  @JsonKey(name: "Status")
  String? status;
  @JsonKey(name: "Nama")
  String? name;
  MasaStudiModel({
    this.startStudy,
    this.endStudy,
    this.remainingStudy,
    this.nim,
    this.researchStats,
    this.email,
    this.phone,
    this.photo,
    this.status,
    this.name,
  });

  MasaStudiModel copyWith({
    String? startStudy,
    String? endStudy,
    String? remainingStudy,
    String? nim,
    String? researchStats,
    String? email,
    String? phone,
    String? photo,
    String? status,
    String? name,
  }) {
    return MasaStudiModel(
      startStudy: startStudy ?? this.startStudy,
      endStudy: endStudy ?? this.endStudy,
      remainingStudy: remainingStudy ?? this.remainingStudy,
      nim: nim ?? this.nim,
      researchStats: researchStats ?? this.researchStats,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      photo: photo ?? this.photo,
      status: status ?? this.status,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toJson() => _$MasaStudiModelToJson(this);

  factory MasaStudiModel.fromJson(Map<String, dynamic> json) => _$MasaStudiModelFromJson(json);

  @override
  String toString() {
    return 'MasaStudiModel(startStudy: $startStudy, endStudy: $endStudy, remainingStudy: $remainingStudy, nim: $nim, researchStats: $researchStats, email: $email, phone: $phone, photo: $photo, status: $status, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MasaStudiModel &&
        other.startStudy == startStudy &&
        other.endStudy == endStudy &&
        other.remainingStudy == remainingStudy &&
        other.nim == nim &&
        other.researchStats == researchStats &&
        other.email == email &&
        other.phone == phone &&
        other.photo == photo &&
        other.status == status &&
        other.name == name;
  }

  @override
  int get hashCode {
    return startStudy.hashCode ^
        endStudy.hashCode ^
        remainingStudy.hashCode ^
        nim.hashCode ^
        researchStats.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        photo.hashCode ^
        status.hashCode ^
        name.hashCode;
  }
}
