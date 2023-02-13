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

class ImagesDefault extends ImagesState {
  ImagesDefault(super._images);
}

class ImagesByAuth extends ImagesState {
  ImagesByAuth(super._images);
}

class StencilImagesByAuth extends ImagesState {
  StencilImagesByAuth(super._images);
}
