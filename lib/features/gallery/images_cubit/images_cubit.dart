import 'package:uuid/uuid.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/image.dart';

part 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> {
  var uuid = const Uuid();
  bool isStencil = true;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference bookingRef = FirebaseDatabase.instance.ref("booking");
  DatabaseReference imagesRef = FirebaseDatabase.instance.ref("images");

  ImagesCubit() : super(ImagesInitial([]));

  void addPicture() async {
    String imageUrl = await methodToSaveImageIntoStorage();
    imagesRef.set(Image(
      id: uuid.v4(),
      author: auth.currentUser!.uid,
      imageUrl: imageUrl,
      isStencil: isStencil,
      timeStamp: DateTime.now().toIso8601String(),
    ));
  }

  Future<String> methodToSaveImageIntoStorage() async {
    return 'url';
  }
}
