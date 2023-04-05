part of 'images_cubit.dart';

abstract class ImagesState {
  final List<Image> _images;
  final List<Image> _filteredImages;

  List<Image> get filteredImages {
    return [..._filteredImages];
  }

  List<Image> get images {
    return [..._images];
  }

  ImagesState(this._images, this._filteredImages);
}

class ImagesInitial extends ImagesState {
  ImagesInitial(super._images, super._filteredImages);
}

class ImagesLoading extends ImagesState {
  ImagesLoading(super._images, super._filteredImages);
}

class ImagesUploadSuccess extends ImagesState {
  ImagesUploadSuccess(super._images, super._filteredImages);
}

class ImagesUploadDenied extends ImagesState {
  ImagesUploadDenied(super._images, super._filteredImages);
}
