import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greatalmuni/application/messagerie/message_state.dart';
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
    User fromUser,
    User toUser,
    String initMessage,
  ) async {
    state = const MessageState.loading();
    try {
      final conversation =
          await messageRepo.getConversationForUsersOrStart(fromUser, toUser);

      messageRepo.addMessageToConversation(
        conversation,
        Message(
          fromUser: fromUser.name,
          toUser: toUser.name,
          content: initMessage,
          createdOn: DateTime.now(),
        ),
      );

      state = const MessageState.sent();
    } catch (e) {
      state = MessageState.error(message: e.toString());
    }
  }
}
