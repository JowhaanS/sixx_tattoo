import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sixx_tattoo/app/constants.dart';
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
        emit(ImagesUploadSuccess(state._images));
      } else {
        emit(ImagesUploadDenied(state._images));
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
        emit(ImagesUploadSuccess(state._images));
      } else {
        emit(ImagesUploadDenied(state._images));
      }
    }
    return;
  }

  void fetchImageData() async {
    emit(ImagesLoading(state._images));
    final rawImages = await imageService.getAllImages();
    if (rawImages.isEmpty) {
      emit(ImagesInitial(state._images));
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
    emit(ImagesInitial(state._images));
  }

  List<Image> showOnlyChristianTattoos() {
    return state._images
        .where((image) =>
            image.author == Constants.artist['number'] &&
            image.isStencil == false)
        .toList();
  }

  List<Image> showOnlyEmanuelTattoos() {
    return state._images
        .where((image) =>
            image.author == Constants.artist2['number'] &&
            image.isStencil == false)
        .toList();
  }

  List<Image> showOnlyChristianStencils() {
    return state._images
        .where((image) =>
            image.author == Constants.artist['number'] &&
            image.isStencil == true)
        .toList();
  }

  List<Image> showOnlyEmanuelStencils() {
    return state._images
        .where((image) =>
            image.author == Constants.artist2['number'] &&
            image.isStencil == true)
        .toList();
  }

  List<Image> showAllTattoos() {
    return state._images.where((image) => image.isStencil == false).toList();
  }

  List<Image> showAllStencils() {
    return state._images.where((image) => image.isStencil == true).toList();
  }
}
