part of 'images_cubit.dart';

abstract class ImagesState {
  final List<Image> _images;

  List<Image> get images {
    return [..._images];
  }

  ImagesState(this._images);
}

class ImagesInitial extends ImagesState {
  ImagesInitial(super._images);
}

class ImagesLoading extends ImagesState {
  ImagesLoading(super._images);
}

class ImagesUploadSuccess extends ImagesState {
  ImagesUploadSuccess(super._images);
}

class ImagesUploadDenied extends ImagesState {
  ImagesUploadDenied(super._images);
}
