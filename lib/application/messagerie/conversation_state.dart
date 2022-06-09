import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:greatalmuni/domain/conversation.dart';

part 'conversation_state.freezed.dart';

@freezed
class ConversationState with _$ConversationState {
  const factory ConversationState.init() = Init;
  const factory ConversationState.loading() = _Loading;
  const factory ConversationState.loaded({
    required List<Conversation> conversations,
  }) = _Loaded;
  const factory ConversationState.error(String message) = _Error;
}
