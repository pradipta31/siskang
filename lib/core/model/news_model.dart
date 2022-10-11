import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  String? idBerita;
  String? judulBerita;
  String? detailBerita;
  String? fotoBerita;
  String? fileBerita;
  String? tglBerita;
  String? statusBerita;
  NewsModel({
    this.idBerita,
    this.judulBerita,
    this.detailBerita,
    this.fotoBerita,
    this.fileBerita,
    this.tglBerita,
    this.statusBerita,
  });

  NewsModel copyWith({
    String? idBerita,
    String? judulBerita,
    String? detailBerita,
    String? fotoBerita,
    String? fileBerita,
    String? tglBerita,
    String? statusBerita,
  }) {
    return NewsModel(
      idBerita: idBerita ?? this.idBerita,
      judulBerita: judulBerita ?? this.judulBerita,
      detailBerita: detailBerita ?? this.detailBerita,
      fotoBerita: fotoBerita ?? this.fotoBerita,
      fileBerita: fileBerita ?? this.fileBerita,
      tglBerita: tglBerita ?? this.tglBerita,
      statusBerita: statusBerita ?? this.statusBerita,
    );
  }

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);

  factory NewsModel.fromJson(Map<String, dynamic> json) => _$NewsModelFromJson(json);

  @override
  String toString() {
    return 'NewsModel(idBerita: $idBerita, judulBerita: $judulBerita, detailBerita: $detailBerita, fotoBerita: $fotoBerita, fileBerita: $fileBerita, tglBerita: $tglBerita, statusBerita: $statusBerita)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewsModel &&
        other.idBerita == idBerita &&
        other.judulBerita == judulBerita &&
        other.detailBerita == detailBerita &&
        other.fotoBerita == fotoBerita &&
        other.fileBerita == fileBerita &&
        other.tglBerita == tglBerita &&
        other.statusBerita == statusBerita;
  }

  @override
  int get hashCode {
    return idBerita.hashCode ^
        judulBerita.hashCode ^
        detailBerita.hashCode ^
        fotoBerita.hashCode ^
        fileBerita.hashCode ^
        tglBerita.hashCode ^
        statusBerita.hashCode;
  }
}
