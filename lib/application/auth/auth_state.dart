import 'package:firebase_auth/firebase_auth.dart';

class AuthState {}

class AuthStateLoggedIn extends AuthState {
  final User? _user;
  User? get user => _user;
  AuthStateLoggedIn(this._user);
}

class AuthStateLoading extends AuthState {}

class AuthStateLoggedOut extends AuthState {}

class AuthStateError extends AuthState {
  String message;
  AuthStateError({
    required this.message,
  });
}
