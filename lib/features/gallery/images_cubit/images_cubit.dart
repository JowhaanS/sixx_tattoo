import 'dart:io';
import 'package:flutter/material.dart' show ScrollController, Curves;
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
  final ScrollController scrollController = ScrollController();

  ImagesCubit() : super(ImagesInitial([], []));

  Future<void> refresh() async {
    emit(ImagesLoading(state._images, state._filteredImages));
    final rawImages = await imageService.refreshImages();
    if (rawImages.isEmpty) {
      emit(ImagesInitial(state._images, state._filteredImages));
      return;
    }
    rawImages.forEach((key, value) {
      final id = value['id'];
      final index = state._images.indexWhere((image) => image.id == id);
      if (index == -1) {
        state._images.add(Image(
          id: id,
          author: value['author'],
          imageUrl: value['imageUrl'],
          isStencil: value['isStencil'],
          timeStamp: value['timeStamp'],
        ));
      }
    });
    emit(ImagesInitial(state._images, state._images));
  }

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
        emit(ImagesUploadSuccess(state._images, state._filteredImages));
      } else {
        emit(ImagesUploadDenied(state._images, state._filteredImages));
      }
    }
    return;
  }

  Future<void> choosePicture(bool isStencil, String id, String number) async {
    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 150,
    );
    if (image != null) {
      File file = File(image.path);
      _didUpload = await imageService.addPicture(isStencil, file, number);
      if (_didUpload) {
        emit(ImagesUploadSuccess(state._images, state._filteredImages));
      } else {
        emit(ImagesUploadDenied(state._images, state._filteredImages));
      }
    }
    return;
  }

  void fetchImageData() async {
    emit(ImagesLoading(state._images, state._filteredImages));
    final rawImages = await imageService.getAllImages();
    if (rawImages.isEmpty) {
      emit(ImagesInitial(state._images, state._filteredImages));
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
    emit(ImagesInitial(state._images, state._images));
  }

  void showOnlyChristianTattoos() {
    emit(
      ImagesInitial(
        state._images,
        state._images
            .where((image) =>
                image.author == Constants.artist['number'] &&
                image.isStencil == false)
            .toList(),
      ),
    );
  }

  void showOnlyEmanuelTattoos() {
    emit(
      ImagesInitial(
        state._images,
        state._images
            .where((image) =>
                image.author == Constants.artist2['number'] &&
                image.isStencil == false)
            .toList(),
      ),
    );
  }

  void showOnlyChristianStencils() {
    emit(
      ImagesInitial(
        state._images,
        state._images
            .where((image) =>
                image.author == Constants.artist['number'] &&
                image.isStencil == true)
            .toList(),
      ),
    );
  }

  void showOnlyEmanuelStencils() {
    emit(
      ImagesInitial(
        state._images,
        state._images
            .where((image) =>
                image.author == Constants.artist2['number'] &&
                image.isStencil == true)
            .toList(),
      ),
    );
  }

  void showAllTattoos() {
    emit(
      ImagesInitial(
        state._images,
        state._images.where((image) => image.isStencil == false).toList(),
      ),
    );
  }

  void showAllStencils() {
    emit(
      ImagesInitial(
        state._images,
        state._images.where((image) => image.isStencil == true).toList(),
      ),
    );
  }

  void showEverything() {
    emit(
      ImagesInitial(state._images, state._images),
    );
  }

  Image findById(String id) {
    return state._images.firstWhere((image) => image.id == id);
  }
}
