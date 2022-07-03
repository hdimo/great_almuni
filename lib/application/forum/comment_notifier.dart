import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greatalmuni/application/forum/comment_state.dart';
import 'package:greatalmuni/domain/comment.dart';
import 'package:greatalmuni/domain/discution.dart';
import 'package:greatalmuni/domain/user.dart';
import 'package:greatalmuni/infrastructure/messagerie/message_repo.dart';

class CommentNotifier extends StateNotifier<CommentState> {
  CommentNotifier(this.messageRepo) : super(const CommentState.init());

  final MessageRepo messageRepo;

  void addCommentToDiscution(Discution discution, User user, String content) {
    state = CommentState.loading();
    final comment = Comment(
      // author: user,
      username: user.name,
      content: content,
      createdOn: DateTime.now(),
    );
    messageRepo.addCommentToDiscution(discution.uid!, comment);
    state = CommentState.init();
  }
}
