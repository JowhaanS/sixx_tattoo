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
  DatabaseReference imagesRef = FirebaseDatabase.instance.ref("images");

  Future<String> addTatto(File file) async {
    final tattooOnStorageRef = storageRef.child('images').child(file.path);
    try {
      await tattooOnStorageRef.putFile(file);
      final imageUrl = await tattooOnStorageRef.getDownloadURL();
      return imageUrl;
    } on FirebaseException catch (e) {
      print(e);
    }
    return 'Error';
  }

  Future<String> addStencil(File file) async {
    final stencilOnStorageRef = storageRef.child('stencils').child(file.path);
    try {
      await stencilOnStorageRef.putFile(file);
      final imageUrl = await stencilOnStorageRef.getDownloadURL();
      return imageUrl;
    } on FirebaseException catch (e) {
      print(e);
    }
    return 'Error';
  }

  void addPicture(bool isStencil, File file, String auth) async {
    if (!isStencil) {
      String imageUrl = await addTatto(file);
      imagesRef.set(Image(
        id: uuid.v4(),
        author: auth,
        imageUrl: imageUrl,
        isStencil: isStencil,
        timeStamp: DateTime.now().toIso8601String(),
      ));
    } else {
      String imageUrl = await addStencil(file);
      imagesRef.set(Image(
        id: uuid.v4(),
        author: auth,
        imageUrl: imageUrl,
        isStencil: isStencil,
        timeStamp: DateTime.now().toIso8601String(),
      ));
    }
  }
}
