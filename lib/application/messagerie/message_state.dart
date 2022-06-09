import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:greatalmuni/domain/conversation.dart';

part 'message_state.freezed.dart';

@freezed
class MessageState with _$MessageState {
  const factory MessageState.init() = _Init;
  const factory MessageState.loading() = _Loading;
  const factory MessageState.sent() = _Sent;
  const factory MessageState.error({required String message}) = _Error;
}
