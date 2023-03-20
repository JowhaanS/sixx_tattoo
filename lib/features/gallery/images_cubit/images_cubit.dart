import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sixx_tattoo/features/gallery/services/image_service.dart';

import '../models/image.dart';

part 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> {
  final imagePicker = ImagePicker();
  late ImageService imageService = ImageService();
  XFile? pickedImage;
  ImagesCubit() : super(ImagesInitial([]));

  Future<void> takePicture(String id) async {}

  void saveImage() {}
  void fetchAndSetImages() {}
}
