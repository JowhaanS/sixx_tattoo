import 'dart:io';

import 'package:uuid/uuid.dart';
// import 'package:http/http.dart' as http;

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/firebase_database.dart';

import '../models/image.dart';

class ImageService {
  var uuid = const Uuid();
  final storage = FirebaseStorage.instance;
  FirebaseDatabase database = FirebaseDatabase.instance;
  // DatabaseReference bookingRef = FirebaseDatabase.instance.ref("booking");
  final storageRef = FirebaseStorage.instance.ref();

  Future<String> _addTatto(File file, String id) async {
    final String fileName = file.path.split('/').last;
    final tattooOnStorageRef = storageRef.child(id).child(fileName);
    try {
      await tattooOnStorageRef.putFile(file);
      final imageUrl = await tattooOnStorageRef.getDownloadURL();
      return imageUrl;
    } on FirebaseException catch (e) {
      return 'Error: + $e';
    }
  }

  Future<String> _addStencil(File file, String id) async {
    final stencilOnStorageRef = storageRef.child(id).child(file.path);
    try {
      await stencilOnStorageRef.putFile(file);
      final imageUrl = await stencilOnStorageRef.getDownloadURL();
      return imageUrl;
    } on FirebaseException catch (e) {
      return 'Error: $e';
    }
  }

  Future<bool> addPicture(
      bool isStencil, File file, String id, String number) async {
    DatabaseReference imagesRef = FirebaseDatabase.instance.ref('images/$id');
    if (!isStencil) {
      String imageUrl = await _addTatto(file, id);
      try {
        imagesRef.push().set(Image(
              id: uuid.v4(),
              author: number,
              imageUrl: imageUrl,
              isStencil: isStencil,
              timeStamp: DateTime.now().toIso8601String(),
            ).toJson());
        return true;
      } catch (e) {
        return false;
      }
    } else {
      String imageUrl = await _addStencil(file, id);
      try {
        imagesRef.push().set(Image(
              id: uuid.v4(),
              author: number,
              imageUrl: imageUrl,
              isStencil: isStencil,
              timeStamp: DateTime.now().toIso8601String(),
            ).toJson());
        return true;
      } catch (e) {
        return false;
      }
    }
  }
}
