import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:greatalmuni/domain/user.dart' as AppUser;
import 'package:greatalmuni/infrastructure/img_uploader.dart';

import 'package:rich_console/printRich.dart';

class UserRepo {
  static String? getUserId() {
    return FirebaseAuth.instance.currentUser?.uid;
  }

  Future<User?> createUser({
    required String name,
    required String email,
    required String password,
    required String speciality,
    required String departement,
    required String year,
    required String hobies,
    required File img,
  }) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        final uid = userCredential.user!.uid;

        final imgUrl = await ImageUploader().upload(img, uid);

        final user = AppUser.User(
          email: email,
          uid: uid,
          name: name,
          departement: departement,
          year: year,
          speciality: speciality,
          hobies: hobies,
          img: imgUrl,
        );

        await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .set(user.toJson());

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

  Future<List<AppUser.User>> readUsers(String path, int limit) async {
    final snapshot =
        await FirebaseFirestore.instance.collection(path).limit(limit).get();

    return snapshot.docs.map(
      (doc) {
        var data = doc.data();
        data['uid'] = doc.reference.id;
        printRich(data);
        return AppUser.User.fromJson(data);
      },
    ).toList();
  }
}
