import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:greatalmuni/domain/core/timestamp_converter.dart';
import 'package:greatalmuni/domain/user.dart';
import 'message.dart';

part 'conversation.freezed.dart';

@freezed
class Conversation with _$Conversation {
  const factory Conversation({
    String? uid,
    required User fromUserId,
    required User toUserId,
    @TimestampConverter() required DateTime createdOn,
    List<Message>? messages,
  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) {
    //TODO: convert user from json to User
    return Conversation(
      uid: json['uid'],
      fromUserId: User.fromJson(json['fromUser']),
      toUserId: User.fromJson(json['toUser']),
      createdOn: json['createdOn'],
    );
  }
}
