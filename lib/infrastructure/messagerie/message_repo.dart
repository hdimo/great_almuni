import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:greatalmuni/domain/conversation.dart';
import 'package:greatalmuni/domain/message.dart';
import 'package:greatalmuni/domain/user.dart';

class MessageRepo {
  Future<List<Conversation>> getAllConversationForUser(String userId) async {
    final listMessages = <Conversation>[];
    await FirebaseFirestore.instance
        .collection('conversation')
        .where('fromUserId', isEqualTo: userId)
        .get()
        .then((event) {
      for (var doc in event.docs) {
        listMessages.add(Conversation.fromJson(doc.data()));
      }
    });
    await FirebaseFirestore.instance
        .collection('conversation')
        .where('toUserId', isEqualTo: userId)
        .get()
        .then((event) {
      for (var doc in event.docs) {
        listMessages.add(Conversation.fromJson(doc.data()));
      }
    });
    return listMessages;
  }

  Future<Conversation> getConversationForUsersOrStart(
      String fromUser, String toUser) async {
    Conversation? conversation;
    final conversationRef =
        FirebaseFirestore.instance.collection('conversation');

    await conversationRef
        .where('fromUserId', isEqualTo: fromUser)
        .where('toUserId', isEqualTo: toUser)
        .get()
        .then((event) {
      if (event.docs.isNotEmpty) {
        var data = event.docs.first.data();
        data['uid'] = event.docs.first.id;
        conversation = Conversation.fromJson(data);
      }
    });
    return conversation ?? await startConversation(fromUser, toUser);
  }

  Future<Conversation> startConversation(String fromUser, String toUser) async {
    final conversation = Conversation(
      fromUserId: fromUser,
      toUserId: toUser,
      createdOn: DateTime.now(),
      messages: [],
    );

    await FirebaseFirestore.instance
        .collection('conversation')
        .add(conversation.toJson());
    return conversation;
  }

  addMessageToConversation(Conversation conversation, Message message) async {
    await FirebaseFirestore.instance
        .collection('conversation')
        .doc(conversation.uid)
        .collection('messages')
        .add(message.toJson());
  }
}
