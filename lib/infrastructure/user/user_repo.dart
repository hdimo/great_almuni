import 'package:firebase_auth/firebase_auth.dart';

class UserRepo {
  static String? getUserId() {
    return FirebaseAuth.instance.currentUser?.uid;
  }

  Future<User?> createUser(String email, String password) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        return userCredential.user;
      } else {
        throw Exception('coul not create users');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        return userCredential.user;
      }
    } catch (e) {
      rethrow;
    }
    throw Exception('error');
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
