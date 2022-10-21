import 'package:json_annotation/json_annotation.dart';

part 'schedule_model.g.dart';

@JsonSerializable()
class ScheduleModel {
  String? idJadwal;
  String? jenisUjian;
  String? nama;
  String? nim;
  String? fotoMhs;
  String? topik;
  String? judul;
  String? pembimbing1;
  String? pembimbing2;
  String? penguji1;
  String? penguji2;
  String? ruangan;
  String? tgl;
  String? waktuMulai;
  String? waktuSelesai;
  ScheduleModel({
    this.idJadwal,
    this.jenisUjian,
    this.nama,
    this.nim,
    this.fotoMhs,
    this.topik,
    this.judul,
    this.pembimbing1,
    this.pembimbing2,
    this.penguji1,
    this.penguji2,
    this.ruangan,
    this.tgl,
    this.waktuMulai,
    this.waktuSelesai,
  });

  ScheduleModel copyWith({
    String? idJadwal,
    String? jenisUjian,
    String? nama,
    String? nim,
    String? fotoMhs,
    String? topik,
    String? judul,
    String? pembimbing1,
    String? pembimbing2,
    String? penguji1,
    String? penguji2,
    String? ruangan,
    String? tgl,
    String? waktuMulai,
    String? waktuSelesai,
  }) {
    return ScheduleModel(
      idJadwal: idJadwal ?? this.idJadwal,
      jenisUjian: jenisUjian ?? this.jenisUjian,
      nama: nama ?? this.nama,
      nim: nim ?? this.nim,
      fotoMhs: fotoMhs ?? this.fotoMhs,
      topik: topik ?? this.topik,
      judul: judul ?? this.judul,
      pembimbing1: pembimbing1 ?? this.pembimbing1,
      pembimbing2: pembimbing2 ?? this.pembimbing2,
      penguji1: penguji1 ?? this.penguji1,
      penguji2: penguji2 ?? this.penguji2,
      ruangan: ruangan ?? this.ruangan,
      tgl: tgl ?? this.tgl,
      waktuMulai: waktuMulai ?? this.waktuMulai,
      waktuSelesai: waktuSelesai ?? this.waktuSelesai,
    );
  }

  Map<String, dynamic> toJson() => _$ScheduleModelToJson(this);

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => _$ScheduleModelFromJson(json);

  @override
  String toString() {
    return 'ScheduleModel(idJadwal: $idJadwal, jenisUjian: $jenisUjian, nama: $nama, nim: $nim, fotoMhs: $fotoMhs, topik: $topik, judul: $judul, pembimbing1: $pembimbing1, pembimbing2: $pembimbing2, penguji1: $penguji1, penguji2: $penguji2, ruangan: $ruangan, tgl: $tgl, waktuMulai: $waktuMulai, waktuSelesai: $waktuSelesai)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ScheduleModel &&
        other.idJadwal == idJadwal &&
        other.jenisUjian == jenisUjian &&
        other.nama == nama &&
        other.nim == nim &&
        other.fotoMhs == fotoMhs &&
        other.topik == topik &&
        other.judul == judul &&
        other.pembimbing1 == pembimbing1 &&
        other.pembimbing2 == pembimbing2 &&
        other.penguji1 == penguji1 &&
        other.penguji2 == penguji2 &&
        other.ruangan == ruangan &&
        other.tgl == tgl &&
        other.waktuMulai == waktuMulai &&
        other.waktuSelesai == waktuSelesai;
  }

  @override
  int get hashCode {
    return idJadwal.hashCode ^
        jenisUjian.hashCode ^
        nama.hashCode ^
        nim.hashCode ^
        fotoMhs.hashCode ^
        topik.hashCode ^
        judul.hashCode ^
        pembimbing1.hashCode ^
        pembimbing2.hashCode ^
        penguji1.hashCode ^
        penguji2.hashCode ^
        ruangan.hashCode ^
        tgl.hashCode ^
        waktuMulai.hashCode ^
        waktuSelesai.hashCode;
  }
}
