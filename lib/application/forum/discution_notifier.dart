import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greatalmuni/application/forum/discution_state.dart';
import 'package:greatalmuni/domain/comment.dart';
import 'package:greatalmuni/domain/discution.dart';
import 'package:greatalmuni/infrastructure/messagerie/message_repo.dart';

class DiscutionNotifier extends StateNotifier<DiscutionState> {
  DiscutionNotifier(this.messageRepo) : super(const DiscutionState.init());

  final MessageRepo messageRepo;

  void addNew(String subject, String content, String category, String userId) {
    final discution = Discution(
      title: subject,
      category: category,
      content: content,
      userId: '/users/' + userId,
      comments: <Comment>[],
      createdOn: DateTime.now(),
    );
    messageRepo.addNewDiscution(discution);
  }

  getDiscutions() {
    state = const DiscutionState.loading();
  }
}
