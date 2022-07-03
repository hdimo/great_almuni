import 'package:freezed_annotation/freezed_annotation.dart';
import './comment.dart';

part 'discution.freezed.dart';
part 'discution.g.dart';

@freezed
class Discution with _$Discution {
  const factory Discution({
    String? uid,
    required String title,
    required String category,
    required String content,
    required String userId,
    List<Comment>? comments,
    required DateTime createdOn,
  }) = _Discution;

  factory Discution.fromJson(Map<String, dynamic> json) =>
      _$DiscutionFromJson(json);
}
