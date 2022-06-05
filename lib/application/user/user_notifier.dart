import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greatalmuni/application/user/user_state.dart';
import 'package:greatalmuni/domain/user.dart';
import 'package:greatalmuni/infrastructure/img_uploader.dart';
import 'package:greatalmuni/infrastructure/user/user_repo.dart';

import 'package:greatalmuni/domain/user.dart' as app;

class UserNotifier extends StateNotifier<UserState> {
  UserRepo userRepo;
  ImageUploader imgUploader;

  UserNotifier({
    required this.userRepo,
    required this.imgUploader,
  }) : super(UserState());

  void registerNewUser(
    String fullname,
    String email,
    String password,
    String speciality,
    String departement,
    String hobies,
    String year,
    File? img,
  ) async {
    state = UserStateLoading();
    try {
      if (img == null) {
        state = UserStateError("l image obligatoire");
        return;
      }
      final user = await userRepo.createUser(
        email: email,
        name: fullname,
        password: password,
        speciality: speciality,
        departement: departement,
        year: year,
        hobies: hobies,
        img: img,
      );

      state = UserStateConnected();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          state = UserStateError("l utiltsateur existe déja");
          break;
        case 'invalid-email:':
          state = UserStateError("invalid-email");
          break;
        case 'weak-password:':
          state = UserStateError("mot de passe faible");
          break;
        default:
          state = UserStateError("operation-not-allowed");
      }
    } catch (e) {
      state = UserStateError("erreur lors de l inscription");
    }
  }
}
