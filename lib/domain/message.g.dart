// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      fromUser: json['fromUser'] as String,
      toUser: json['toUser'] as String?,
      content: json['content'] as String,
      createdOn: DateTime.parse(json['createdOn'] as String),
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'fromUser': instance.fromUser,
      'toUser': instance.toUser,
      'content': instance.content,
      'createdOn': instance.createdOn.toIso8601String(),
    };
