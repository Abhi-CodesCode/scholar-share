import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

Future<String> uploadImage(File imageFile) async {
  String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  firebase_storage.Reference reference =
  firebase_storage.FirebaseStorage.instance.ref().child('images/$fileName');
  firebase_storage.UploadTask uploadTask = reference.putFile(imageFile);
  firebase_storage.TaskSnapshot snapshot = await uploadTask;
  String downloadUrl = await snapshot.ref.getDownloadURL();
  return downloadUrl;
}
