import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class ImageUploader {
  late FirebaseStorage storage;

  ImageUploader() {
    storage =
        FirebaseStorage.instanceFor(bucket: 'gs://greatalmuni.appspot.com');
  }

  Future<String> upload(File file, String userId) async {
    var storageRef = storage.ref().child('user/profile/$userId');
    try {
      UploadTask uploadTask = storageRef.putFile(file);
      return await storageRef.getDownloadURL();
    } catch (e) {
      print('error');
      rethrow;
    }
  }
}
