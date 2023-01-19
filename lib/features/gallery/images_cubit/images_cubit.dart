import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/image.dart';

part 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> {
  ImagesCubit() : super(ImagesInitial());

  List<Image> _images = [];

  List<Image> get images {
    return [..._images];
  }
}
