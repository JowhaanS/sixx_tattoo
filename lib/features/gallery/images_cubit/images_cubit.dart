import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/image.dart';

part 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> {
  ImagesCubit() : super(ImagesInitial());

  final List<Image> _images = [];
}
