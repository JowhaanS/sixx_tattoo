import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sixx_tattoo/features/gallery/images_cubit/images_cubit.dart';
import 'package:sixx_tattoo/features/gallery/widgets/gallery_item.dart';

class GalleryGrid extends StatelessWidget {
  const GalleryGrid({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagesCubit, ImagesState>(
      builder: (context, state) {
        return GridView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount:
              BlocProvider.of<ImagesCubit>(context).state.filteredImages.length,
          itemBuilder: (ctx, i) {
            return GalleryItem(
              image:
                  BlocProvider.of<ImagesCubit>(context).state.filteredImages[i],
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        );
      },
    );
  }
}
