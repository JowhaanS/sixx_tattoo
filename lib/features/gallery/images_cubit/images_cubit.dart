import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sixx_tattoo/features/gallery/services/image_service.dart';

import '../models/image.dart';

part 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> {
  final imagePicker = ImagePicker();
  late ImageService imageService = ImageService();
  ImagesCubit() : super(ImagesInitial([]));

  Future<void> takePicture(String id) async {
    print('kommer vi hit?');
    final imageFile = await imagePicker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (imageFile == null) {
      return;
    }
    File storedImage = File(imageFile.path);
    bool isStencil = true;
    // final appDir = await syspaths.getApplicationDocumentsDirectory();
    // final fileName = path.basename(imageFile.path);
    // final savedImage =
    //     await File(imageFile.path).copy('${appDir.path}/$fileName');
    imageService.addPicture(isStencil, storedImage, id);
  }

  void printHelloWorld() {
    print('Hello World');
  }

  void saveImage() {}
  void fetchAndSetImages() {}
}
