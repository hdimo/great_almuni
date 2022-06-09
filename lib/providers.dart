import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greatalmuni/application/annuaire/annuaire_notifier.dart';
import 'package:greatalmuni/application/annuaire/annuaire_state.dart';
import 'package:greatalmuni/application/auth/auth_notifier.dart';
import 'package:greatalmuni/application/auth/auth_state.dart';
import 'package:greatalmuni/application/messagerie/message_notifier.dart';
import 'package:greatalmuni/application/messagerie/message_state.dart';
import 'package:greatalmuni/application/user/user_notifier.dart';
import 'package:greatalmuni/application/user/user_state.dart';
import 'package:greatalmuni/infrastructure/img_uploader.dart';
import 'package:greatalmuni/infrastructure/messagerie/message_repo.dart';
import 'package:greatalmuni/infrastructure/user/user_repo.dart';
import 'package:greatalmuni/application/messagerie/conversation_notifier.dart';
import 'package:greatalmuni/application/messagerie/conversation_state.dart';

final imageUploaderProvider = Provider<ImageUploader>((ref) {
  return ImageUploader();
});

final userRepositoryProvider = Provider<UserRepo>((ref) {
  return UserRepo();
});

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.watch(userRepositoryProvider));
});

final userNotifierProvider =
    StateNotifierProvider<UserNotifier, UserState>((ref) => UserNotifier(
          userRepo: ref.watch(userRepositoryProvider),
          imgUploader: ref.watch(imageUploaderProvider),
        ));

final annuaireProvider = StateNotifierProvider<AnnuaireNotifier, AnnuaireState>(
    (ref) => AnnuaireNotifier(ref.watch(userRepositoryProvider)));

final messageProvider =
    StateNotifierProvider.autoDispose<MessageNotifier, MessageState>(
        (ref) => MessageNotifier(MessageRepo()));

final conversationStateProvider =
    StateNotifierProvider.autoDispose<ConversationNotifier, ConversationState>(
        (ref) => ConversationNotifier(MessageRepo()));
