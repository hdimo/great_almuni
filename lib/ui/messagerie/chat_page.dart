import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greatalmuni/infrastructure/messagerie/message_repo.dart';

import '../../domain/conversation.dart';

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({Key? key, required this.conversation}) : super(key: key);

  final Conversation conversation;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  @override
  Widget build(BuildContext context) {
    final msgs = MessageRepo().getMessages(widget.conversation.uid);
    return Scaffold(
      appBar: AppBar(title: Text('Message')),
      body: StreamBuilder(
        stream: msgs,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          return ListView(
            children: snapshot.data!.docs
                .map((DocumentSnapshot document) {
                  print('🅰️');
                  print(document.data());
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return ListTile(
                    title: Text(data['content']),
                    // subtitle: Text(data['company']),
                  );
                })
                .toList()
                .cast(),
          );
        },
      ),
    );
  }
}
