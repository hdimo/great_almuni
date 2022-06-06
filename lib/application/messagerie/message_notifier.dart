import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greatalmuni/application/messagerie/message_state.dart';
import 'package:greatalmuni/infrastructure/messagerie/message_repo.dart';

class MessageNotifier extends StateNotifier<MessageState> {
  MessageNotifier() : super(MessageState.loading());

  void getMessages(userId) {
    MessageRepo().getAllConversationForUser(userId);
  }
}
