import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greatalmuni/application/auth/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthStateLoggedOut());

  void login(String email, String password) async {
    state = AuthStateLoading();

    final userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (userCredential.user != null) {
      state = AuthStateLoggedIn(userCredential.user);
    }
  }

  void logout() {
    FirebaseAuth.instance.signOut();
    state = AuthStateLoggedOut();
  }
}
