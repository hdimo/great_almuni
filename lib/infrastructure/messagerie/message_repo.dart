import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
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
        print('🅰️');
        var data = doc.data();
        data['uid'] = doc.id;

        //TODO: should convert fromUser / toUserid => User before
        listMessages.add(Conversation.fromJson(data));
      }
    });
    await FirebaseFirestore.instance
        .collection('conversation')
        .where('toUserId', isEqualTo: userId)
        .get()
        .then((event) {
      for (var doc in event.docs) {
        var data = doc.data();
        data['uid'] = doc.id;
        listMessages.add(Conversation.fromJson(data));
      }
    });
    return listMessages;
  }

  Future<Conversation> getConversationForUsersOrStart(
    String fromUserId,
    String fromUserName,
    String toUserId,
    String toUserName,
  ) async {
    Conversation? conversation;
    final conversationRef =
        FirebaseFirestore.instance.collection('conversation');

    await conversationRef
        .where('fromUserId', isEqualTo: fromUserId)
        .where('toUserId', isEqualTo: toUserId)
        .get()
        .then((event) {
      if (event.docs.isNotEmpty) {
        var data = event.docs.first.data();
        data['uid'] = event.docs.first.id;
        conversation = Conversation.fromJson(data);
      }
    });
    return conversation ??
        await startConversation(
          fromUserId,
          fromUserName,
          toUserId,
          toUserName,
        );
  }

  Future<Conversation> startConversation(
    String fromUserId,
    String fromUserName,
    String toUserId,
    String toUserName,
  ) async {
    // FirebaseFirestore.instance
    //     .doc('/users/' + fromUser)
    //     .get()
    //     .then((value) => null);

    final conversation = Conversation(
      fromUserId: fromUserId,
      fromUserName: fromUserName,
      toUserId: toUserId,
      toUserName: toUserName,
      createdOn: DateTime.now(),
      messages: [],
    );

    await FirebaseFirestore.instance
        .collection('conversation')
        .add(conversation.toJson());
    return conversation;
  }

  Future<void> addMessageToConversation(
    Conversation conversation,
    Message message,
  ) async {
    await FirebaseFirestore.instance
        .collection('conversation')
        .doc(conversation.uid)
        .collection('messages')
        .add(message.toJson());
  }

  getMessages(conversationid) {
    return FirebaseFirestore.instance
        .collection('conversation')
        .doc(conversationid)
        .collection('messages')
        .snapshots();
  }
}
