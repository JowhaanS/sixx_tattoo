import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sixx_tattoo/features/gallery/services/image_service.dart';

import '../models/image.dart';

part 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> {
  bool _didUpload = false;
  final imagePicker = ImagePicker();
  late ImageService imageService = ImageService();
  XFile? pickedImage;
  ImagesCubit() : super(ImagesInitial([]));

  Future<void> takePicture(String id, String number) async {
    final XFile? photo = await imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
    );
    if (photo != null) {
      File file = File(photo.path);
      _didUpload = await imageService.addPicture(false, file, number);
      if (_didUpload) {
        emit(ImagesUploadSuccess(state.images));
      } else {
        emit(ImagesUploadDenied(state.images));
      }
    }
    return;
  }

  Future<void> choosePicture(String id, String number) async {
    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 150,
    );
    if (image != null) {
      File file = File(image.path);
      _didUpload = await imageService.addPicture(false, file, number);
      if (_didUpload) {
        emit(ImagesUploadSuccess(state.images));
      } else {
        emit(ImagesUploadDenied(state.images));
      }
    }
    return;
  }

  void fetchAndSetImages() async {
    emit(ImagesLoading(state.images));
    final rawImages = await imageService.getAllImages();
    if (state._images.length >= rawImages.length) {
      emit(ImagesInitial(state.images));
      return;
    }
    rawImages.forEach((key, value) {
      state._images.add(Image(
          id: value['id'],
          author: value['author'],
          imageUrl: value['imageUrl'],
          isStencil: value['isStencil'],
          timeStamp: value['timeStamp']));
    });
    emit(ImagesInitial(state.images));
  }
}
