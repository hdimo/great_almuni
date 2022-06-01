import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greatalmuni/application/user/user_state.dart';

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier() : super(UserState());

  void registerNewUser(
    String fullname,
    String email,
    String password,
    String speciality,
    String departement,
    String hobies,
  ) async {}

  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    return credential.user;
  }
}
