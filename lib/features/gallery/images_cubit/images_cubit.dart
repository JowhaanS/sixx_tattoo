import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sixx_tattoo/features/gallery/services/image_service.dart';

import '../models/image.dart';

part 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> {
  ImageService service = ImageService();
  final picker = ImagePicker();
  late File _pickedImage;
  late File _storedImage;
  late bool isStencil;

  ImagesCubit() : super(ImagesInitial([]));

  Future<void> takePicture(String id) async {
    final imageFile = await picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (imageFile == null) {
      return;
    }
    _storedImage = File(imageFile.path);
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage =
        await File(imageFile.path).copy('${appDir.path}/$fileName');
    service.addPicture(isStencil, savedImage, id);
    selectImage(savedImage);
  }

  void selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void saveImage() {}
}
