import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greatalmuni/application/auth/auth_state.dart';
import 'package:greatalmuni/domain/message.dart';
import 'package:greatalmuni/infrastructure/messagerie/message_repo.dart';
import 'package:greatalmuni/providers.dart';
import 'package:intl/intl.dart';

import '../../domain/conversation.dart';

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({Key? key, required this.conversation}) : super(key: key);

  final Conversation conversation;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  TextEditingController? _messageController;
  ScrollController? _scrollController;

  @override
  void initState() {
    _messageController = TextEditingController();
    _scrollController = ScrollController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = (ref.watch(authProvider) as AuthStateLoggedIn).user;

    final msgs = MessageRepo().getMessages(widget.conversation.uid);
    return Scaffold(
      appBar: AppBar(title: const Text('Message')),
      body: StreamBuilder(
        stream: msgs,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: Container(width: 100, child: LinearProgressIndicator()));
          }

          return Column(
            children: [
              Expanded(
                flex: 5,
                child: ListView(
                  controller: _scrollController,
                  children: snapshot.data!.docs
                      .map((DocumentSnapshot document) {
                        print('🅰️');
                        print(document.data());
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;

                        var message = Message.fromJson(data);
                        return ListTile(
                          title: Text(message.content),
                          subtitle: Text(
                              DateFormat('kk:mm').format(message.createdOn)),
                        );
                      })
                      .toList()
                      .cast(),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 45,
                        child: TextField(
                          controller: _messageController,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 5,
                          )),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton.icon(
                        onPressed: () {
                          ref
                              .read(messageProvider.notifier)
                              .addMessageToConversation(
                                widget.conversation,
                                _messageController!.text,
                                currentUser!.uid,
                              );
                          _messageController?.clear();
                          _scrollController?.jumpTo(
                              _scrollController!.position.maxScrollExtent);
                        },
                        icon: const Icon(Icons.send),
                        label: const Text(''),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
