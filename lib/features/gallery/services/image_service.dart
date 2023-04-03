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

  Future<String> _addTatto(File file) async {
    final String fileName = file.path.split('/').last;
    final tattooOnStorageRef = storageRef.child('images').child(fileName);
    try {
      await tattooOnStorageRef.putFile(file);
      final imageUrl = await tattooOnStorageRef.getDownloadURL();
      return imageUrl;
    } on FirebaseException catch (e) {
      return 'Error: + $e';
    }
  }

  Future<String> _addStencil(File file) async {
    final String fileName = file.path.split('/').last;
    final stencilOnStorageRef = storageRef.child('images').child(fileName);
    try {
      await stencilOnStorageRef.putFile(file);
      final imageUrl = await stencilOnStorageRef.getDownloadURL();
      return imageUrl;
    } on FirebaseException catch (e) {
      return 'Error: $e';
    }
  }

  Future<bool> addPicture(bool isStencil, File file, String number) async {
    DatabaseReference imagesRef = FirebaseDatabase.instance.ref('images');
    if (!isStencil) {
      String imageUrl = await _addTatto(file);
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
      String imageUrl = await _addStencil(file);
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

  Future<Map<dynamic, dynamic>> getAllImages() async {
    Map<dynamic, dynamic> data = {};
    final ref = database.ref();
    await ref.child('images').once(DatabaseEventType.value).then((value) {
      final rawData = value.snapshot.children.fold<Map<dynamic, dynamic>>(
        {},
        (Map<dynamic, dynamic> map, DataSnapshot childSnapshot) {
          map[childSnapshot.key] = childSnapshot.value;
          return map;
        },
      );
      data = rawData;
    });
    return data;
  }
}
