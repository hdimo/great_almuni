import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:greatalmuni/domain/user.dart';

part 'annuaire_state.freezed.dart';

@freezed
class AnnuaireState with _$AnnuaireState {
  const factory AnnuaireState.loading() = _Loading;
  const factory AnnuaireState.loaded({required List<User> users}) = _Loaded;
  const factory AnnuaireState.error(String message) = _Error;
}
