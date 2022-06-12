import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  const factory Message({
    required String fromUser,
    String? toUser,
    required String content,
    required DateTime createdOn,
  }) = _Message;

  factory Message.now({required String fromUser, required String content}) {
    return Message(
      fromUser: fromUser,
      content: content,
      createdOn: DateTime.now(),
    );
  }

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
