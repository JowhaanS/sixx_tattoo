import 'package:flutter/material.dart';
import '../models/image.dart' as image_model;

class GalleryItem extends StatelessWidget {
  final image_model.Image image;
  const GalleryItem({required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
          child: GestureDetector(
        onTap: () {},
        child: Hero(
          tag: image.id,
          child: FadeInImage(
            placeholder: const AssetImage('assets/images/logo_b&w.jpg'),
            image: NetworkImage(image.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      )),
    );
  }
}
