import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:greatalmuni/domain/conversation.dart';
import 'package:greatalmuni/domain/user.dart';

class MessageRepo {
  Future<void> getAllConversationForUser(String userId) async {
    final listMessages = <Conversation>[];
    await FirebaseFirestore.instance
        .collection('conversation')
        .where('fromUserId', isEqualTo: userId)
        .where('toUserId', isEqualTo: userId)
        .snapshots()
        .forEach((element) {
      print('🅰️');
      print(element.toString());
    }).then((value) => print(value));
  }
}
