import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greatalmuni/application/auth/auth_notifier.dart';
import 'package:greatalmuni/application/auth/auth_state.dart';
import 'package:greatalmuni/application/user/user_notifier.dart';
import 'package:greatalmuni/application/user/user_state.dart';
import 'package:greatalmuni/infrastructure/img_uploader.dart';
import 'package:greatalmuni/infrastructure/user/user_repo.dart';

final imageUploaderProvider = Provider<ImageUploader>((ref) {
  return ImageUploader();
});

final userRepositoryProvider = Provider<UserRepo>((ref) {
  return UserRepo();
});

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.watch(userRepositoryProvider));
});

final userNotifierProvider =
    StateNotifierProvider<UserNotifier, UserState>((ref) {
  return UserNotifier(
    userRepo: ref.watch(userRepositoryProvider),
    imgUploader: ref.watch(imageUploaderProvider),
  );
});
