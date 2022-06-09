import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greatalmuni/application/auth/auth_state.dart';
import 'package:greatalmuni/application/messagerie/conversation_state.dart';
import 'package:greatalmuni/domain/conversation.dart';
import 'package:greatalmuni/providers.dart';

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
                return ListTile(
                  title: Text(conversations[index].fromUserId),
                );
              },
            );
          },
          error: (message) => Center(child: Text(message)),
        );
  }
}
