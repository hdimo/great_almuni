import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:greatalmuni/domain/discution.dart';

part 'discution_state.freezed.dart';

@freezed
class DiscutionState with _$DiscutionState {
  const factory DiscutionState.init() = _Init;
  const factory DiscutionState.loading() = _Loading;
  const factory DiscutionState.loaded({required List<Discution> discutions}) =
      _Loaded;
}
