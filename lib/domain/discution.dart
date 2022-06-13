import 'package:freezed_annotation/freezed_annotation.dart';

part 'discution.freezed.dart';
part 'discution.g.dart';

@freezed
class Discution with _$Discution {
  const factory Discution({
    required String title,
    required String category,
    required String content,
    required String userId,
    required DateTime createdOn,
  }) = _Discution;

  factory Discution.fromJson(Map<String, dynamic> json) =>
      _$DiscutionFromJson(json);
}
