// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Discution _$$_DiscutionFromJson(Map<String, dynamic> json) => _$_Discution(
      title: json['title'] as String,
      category: json['category'] as String,
      content: json['content'] as String,
      userId: json['userId'] as String,
      createdOn: DateTime.parse(json['createdOn'] as String),
    );

Map<String, dynamic> _$$_DiscutionToJson(_$_Discution instance) =>
    <String, dynamic>{
      'title': instance.title,
      'category': instance.category,
      'content': instance.content,
      'userId': instance.userId,
      'createdOn': instance.createdOn.toIso8601String(),
    };
