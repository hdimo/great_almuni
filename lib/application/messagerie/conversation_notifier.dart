import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greatalmuni/application/messagerie/conversation_state.dart';
import 'package:greatalmuni/infrastructure/messagerie/message_repo.dart';

class ConversationNotifier extends StateNotifier<ConversationState> {
  ConversationNotifier(this.messageRepo)
      : super(const ConversationState.init());

  MessageRepo messageRepo;

  getAllConversationForUser(String userId) async {
    state = const ConversationState.loading();
    try {
      final conversations = await messageRepo.getAllConversationForUser(userId);
      state = ConversationState.loaded(conversations: conversations);
    } catch (e) {
      state = ConversationState.error(e.toString());
      rethrow;
    }
  }
}
