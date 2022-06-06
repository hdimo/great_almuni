import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:greatalmuni/domain/conversation.dart';

part 'message_state.freezed.dart';

@freezed
class MessageState with _$MessageState {
  const factory MessageState.loading() = _Loading;
  const factory MessageState.loaded({
    required List<Conversation> conversations,
  }) = _Loaded;
  const factory MessageState.error({required String message}) = _Error;
}
