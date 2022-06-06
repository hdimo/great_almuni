import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';

@freezed
class Message with _$Message {
  const factory Message({
    required String fromUser,
    required String toUser,
    required String content,
    required DateTime createdOn,
  }) = _Message;
}
