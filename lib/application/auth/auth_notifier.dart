import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greatalmuni/application/auth/auth_state.dart';
import 'package:greatalmuni/infrastructure/user/user_repo.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  UserRepo userRepo;
  AuthNotifier(this.userRepo) : super(AuthStateLoggedOut());

  void login(String email, String password) async {
    state = AuthStateLoading();
    try {
      final user = await userRepo.loginWithEmailAndPassword(email, password);

      if (user != null) {
        state = AuthStateLoggedIn(user);
      } else {
        state = AuthStateError(message: 'login erreur');
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          state = AuthStateError(message: 'email invalide');
          break;
        case 'user-disabled':
          state = AuthStateError(message: 'utilisateur bani');
          break;
        case 'user-not-found':
        case 'wrong-password':
          state =
              AuthStateError(message: 'utilisateur / mot de passe invalide');
          break;
        default:
          state =
              AuthStateError(message: 'une erreur lors de l\'authentification');
      }
    } catch (e) {
      state = AuthStateError(message: 'une erreur de serveur');
    }
  }

  void logout() async {
    await userRepo.logout();
    state = AuthStateLoggedOut();
  }
}
