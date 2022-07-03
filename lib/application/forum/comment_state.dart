import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_state.freezed.dart';

@freezed
class CommentState with _$CommentState {
  const factory CommentState.init() = _Init;
  const factory CommentState.loading() = _Loading;
}
