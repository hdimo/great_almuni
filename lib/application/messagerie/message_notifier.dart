import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greatalmuni/application/messagerie/message_state.dart';
import 'package:greatalmuni/domain/conversation.dart';
import 'package:greatalmuni/domain/message.dart';
import 'package:greatalmuni/domain/user.dart';
import 'package:greatalmuni/infrastructure/messagerie/message_repo.dart';

class MessageNotifier extends StateNotifier<MessageState> {
  MessageNotifier(this.messageRepo) : super(const MessageState.init());

  MessageRepo messageRepo;

  void getMessages(userId) {
    MessageRepo().getAllConversationForUser(userId);
  }

  void startConversationWithUser(
    String fromUserId,
    String fromUserName,
    String toUserId,
    String toUserName,
    String initMessage,
  ) async {
    state = const MessageState.loading();
    try {
      final conversation = await messageRepo.getConversationForUsersOrStart(
        fromUserId,
        fromUserName,
        toUserId,
        toUserName,
      );

      messageRepo.addMessageToConversation(
        conversation,
        Message(
          fromUser: fromUserName,
          toUser: toUserName,
          content: initMessage,
          createdOn: DateTime.now(),
        ),
      );

      state = const MessageState.sent();
    } catch (e) {
      state = MessageState.error(message: e.toString());
    }
  }

  addMessageToConversation(
      Conversation conversationId, String text, String userId) {
    messageRepo.addMessageToConversation(
        conversationId,
        Message.now(
          fromUser: userId,
          content: text,
        ));
  }
}
