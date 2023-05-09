import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sixx_tattoo/features/gallery/images_cubit/images_cubit.dart';
import 'package:sixx_tattoo/features/gallery/widgets/big_screen/custom_gallery_tab_bar.dart';
import 'package:sixx_tattoo/features/gallery/widgets/gallery_item.dart';

class GalleryGrid extends StatelessWidget {
  const GalleryGrid({super.key});
  @override
  Widget build(BuildContext context) {
    bool isScreenBig = MediaQuery.of(context).size.width >= 480;
    return BlocBuilder<ImagesCubit, ImagesState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: RefreshIndicator(
          onRefresh: () => BlocProvider.of<ImagesCubit>(context).refresh(),
          child: GridView.builder(
            controller: BlocProvider.of<ImagesCubit>(context).scrollController,
            padding: const EdgeInsets.all(10.0),
            itemCount: BlocProvider.of<ImagesCubit>(context)
                .state
                .filteredImages
                .length,
            itemBuilder: (ctx, i) {
              return GalleryItem(
                image: BlocProvider.of<ImagesCubit>(context)
                    .state
                    .filteredImages[i],
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isScreenBig ? 4 : 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
          ),
        ),
        bottomNavigationBar: isScreenBig ? const CustomGalleryTabBar() : null,
      );
    });
  }
}
