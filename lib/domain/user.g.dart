// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      email: json['email'] as String,
      uid: json['uid'] as String,
      name: json['name'] as String,
      departement: json['departement'] as String?,
      year: json['year'] as String?,
      speciality: json['speciality'] as String?,
      hobies: json['hobies'] as String?,
      img: json['img'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'email': instance.email,
      'uid': instance.uid,
      'name': instance.name,
      'departement': instance.departement,
      'year': instance.year,
      'speciality': instance.speciality,
      'hobies': instance.hobies,
      'img': instance.img,
    };
