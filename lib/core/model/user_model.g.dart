// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['Id'] as String?,
      name: json['Nama'] as String?,
      nim: json['Nim'] as String?,
      prodiId: json['Id_prodi'] as String?,
      prodiCode: json['Kode_prodi'] as String?,
      prodiName: json['Nama_prodi'] as String?,
      email: json['Email'] as String?,
      photo: json['Foto'] as String?,
      username: json['Username'] as String?,
      password: json['Password'] as String?,
      decryptPass: json['Passwordplain'] as String?,
      nimName: json['Nim_Nama'] as String?,
      phoneNum: json['no_telp'] as String?,
      jabatan: json['jabatan'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'Id': instance.id,
      'Nama': instance.name,
      'Nim': instance.nim,
      'Id_prodi': instance.prodiId,
      'Kode_prodi': instance.prodiCode,
      'Nama_prodi': instance.prodiName,
      'Email': instance.email,
      'Foto': instance.photo,
      'Username': instance.username,
      'Password': instance.password,
      'Passwordplain': instance.decryptPass,
      'Nim_Nama': instance.nimName,
      'no_telp': instance.phoneNum,
      'jabatan': instance.jabatan,
    };
