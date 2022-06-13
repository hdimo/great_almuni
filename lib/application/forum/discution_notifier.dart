import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greatalmuni/application/forum/discution_state.dart';
import 'package:greatalmuni/domain/discution.dart';
import 'package:greatalmuni/infrastructure/messagerie/message_repo.dart';

class DiscutionNotifier extends StateNotifier<DiscutionState> {
  DiscutionNotifier(this.messageRepo) : super(const DiscutionState.init());

  final MessageRepo messageRepo;

  void addNew(String subject, String content, String category, String userId) {
    final discution = new Discution(
      title: subject,
      category: category,
      content: content,
      userId: '/users/' + userId,
      createdOn: DateTime.now(),
    );
    messageRepo.addNewDiscution(discution);
  }

  getDiscutions() {
    state = DiscutionState.loading();
  }
}
