import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greatalmuni/application/auth/auth_state.dart';
import 'package:greatalmuni/application/messagerie/conversation_state.dart';
import 'package:greatalmuni/domain/conversation.dart';
import 'package:greatalmuni/providers.dart';
import 'package:greatalmuni/ui/messagerie/chat_page.dart';

class MessagerieHomePage extends ConsumerStatefulWidget {
  const MessagerieHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MessagerieHomePageState();
}

class _MessagerieHomePageState extends ConsumerState<MessagerieHomePage> {
  @override
  Widget build(BuildContext context) {
    final user = (ref.watch(authProvider) as AuthStateLoggedIn).user;

    return ref.watch(conversationStateProvider).when(
          init: () {
            return Center(
              child: ElevatedButton(
                  onPressed: () {
                    ref
                        .read(conversationStateProvider.notifier)
                        .getAllConversationForUser(user!.uid);
                  },
                  child: Text('Afficher')),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (conversations) {
            return ListView.builder(
              itemCount: conversations.length,
              itemBuilder: (context, index) {
                final _title =
                    "${conversations[index].fromUserName} <=> ${conversations[index].toUserName}";
                return ListTile(
                  title: Text(_title),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ChatPage(
                          conversation: conversations[index],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
          error: (message) => Center(child: Text(message)),
        );
  }
}
