// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Discution _$$_DiscutionFromJson(Map<String, dynamic> json) => _$_Discution(
      uid: json['uid'] as String?,
      title: json['title'] as String,
      category: json['category'] as String,
      content: json['content'] as String,
      userId: json['userId'] as String,
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdOn: DateTime.parse(json['createdOn'] as String),
    );

Map<String, dynamic> _$$_DiscutionToJson(_$_Discution instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'title': instance.title,
      'category': instance.category,
      'content': instance.content,
      'userId': instance.userId,
      'comments': instance.comments,
      'createdOn': instance.createdOn.toIso8601String(),
    };
