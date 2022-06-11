// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Conversation _$$_ConversationFromJson(Map<String, dynamic> json) =>
    _$_Conversation(
      uid: json['uid'] as String?,
      fromUserId: json['fromUserId'] as String,
      fromUserName: json['fromUserName'] as String,
      toUserId: json['toUserId'] as String,
      toUserName: json['toUserName'] as String,
      createdOn:
          const TimestampConverter().fromJson(json['createdOn'] as Timestamp),
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ConversationToJson(_$_Conversation instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'fromUserId': instance.fromUserId,
      'fromUserName': instance.fromUserName,
      'toUserId': instance.toUserId,
      'toUserName': instance.toUserName,
      'createdOn': const TimestampConverter().toJson(instance.createdOn),
      'messages': instance.messages,
    };
