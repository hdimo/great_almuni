import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greatalmuni/application/auth/auth_notifier.dart';
import 'package:greatalmuni/application/auth/auth_state.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});
