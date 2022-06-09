import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greatalmuni/application/annuaire/annuaire_state.dart';
import 'package:greatalmuni/infrastructure/user/user_repo.dart';

class AnnuaireNotifier extends StateNotifier<AnnuaireState> {
  AnnuaireNotifier(this.userRepo) : super(const AnnuaireState.loading()) {
    getUsers();
  }

  UserRepo userRepo;

  void getUsers() async {
    state = const AnnuaireState.loading();
    try {
      final users = await userRepo.readUsers('users', 5);
      state = AnnuaireState.loaded(users: users);
    } catch (e) {
      state = AnnuaireState.error(e.toString());
    }
  }
}
