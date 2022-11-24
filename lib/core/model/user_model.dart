import 'dart:convert';

import 'package:image_picker/image_picker.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: "Id")
  String? id;
  @JsonKey(name: "Nama")
  String? name;
  @JsonKey(name: "Nim")
  String? nim;
  @JsonKey(name: "Id_prodi")
  String? prodiId;
  @JsonKey(name: "Kode_prodi")
  String? prodiCode;
  @JsonKey(name: "Nama_prodi")
  String? prodiName;
  @JsonKey(name: "Email")
  String? email;
  @JsonKey(name: "Foto")
  String? photo;
  @JsonKey(name: "Username")
  String? username;
  @JsonKey(name: "Password")
  String? password;
  @JsonKey(name: "Passwordplain")
  String? decryptPass;
  @JsonKey(name: "Nim_Nama")
  String? nimName;
  @JsonKey(name: "no_telp")
  String? phoneNum;
  String? jabatan;
  @JsonKey(ignore: true)
  XFile? tempImage;
  UserModel({
    this.id,
    this.name,
    this.nim,
    this.prodiId,
    this.prodiCode,
    this.prodiName,
    this.email,
    this.photo,
    this.username,
    this.password,
    this.decryptPass,
    this.nimName,
    this.phoneNum,
    this.jabatan,
    this.tempImage,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? nim,
    String? prodiId,
    String? prodiCode,
    String? prodiName,
    String? email,
    String? photo,
    String? username,
    String? password,
    String? decryptPass,
    String? nimName,
    String? phoneNum,
    String? jabatan,
    XFile? tempImage,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      nim: nim ?? this.nim,
      prodiId: prodiId ?? this.prodiId,
      prodiCode: prodiCode ?? this.prodiCode,
      prodiName: prodiName ?? this.prodiName,
      email: email ?? this.email,
      photo: photo ?? this.photo,
      username: username ?? this.username,
      password: password ?? this.password,
      decryptPass: decryptPass ?? this.decryptPass,
      nimName: nimName ?? this.nimName,
      phoneNum: phoneNum ?? this.phoneNum,
      jabatan: jabatan ?? this.jabatan,
      tempImage: tempImage ?? this.tempImage,
    );
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, nim: $nim, prodiId: $prodiId, prodiCode: $prodiCode, prodiName: $prodiName, email: $email, photo: $photo, username: $username, password: $password, decryptPass: $decryptPass, nimName: $nimName, phoneNum: $phoneNum, jabatan: $jabatan, tempImage: $tempImage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        other.nim == nim &&
        other.prodiId == prodiId &&
        other.prodiCode == prodiCode &&
        other.prodiName == prodiName &&
        other.email == email &&
        other.photo == photo &&
        other.username == username &&
        other.password == password &&
        other.decryptPass == decryptPass &&
        other.nimName == nimName &&
        other.phoneNum == phoneNum &&
        other.jabatan == jabatan &&
        other.tempImage == tempImage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        nim.hashCode ^
        prodiId.hashCode ^
        prodiCode.hashCode ^
        prodiName.hashCode ^
        email.hashCode ^
        photo.hashCode ^
        username.hashCode ^
        password.hashCode ^
        decryptPass.hashCode ^
        nimName.hashCode ^
        phoneNum.hashCode ^
        jabatan.hashCode ^
        tempImage.hashCode;
  }
}
