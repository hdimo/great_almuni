import 'package:freezed_annotation/freezed_annotation.dart';
import './user.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    // required User author,
    required String username, // just used to avoid calling database
    required String content,
    required DateTime createdOn,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
