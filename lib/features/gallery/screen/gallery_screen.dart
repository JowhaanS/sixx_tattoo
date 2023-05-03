import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sixx_tattoo/app/constants.dart';
import 'package:sixx_tattoo/features/gallery/images_cubit/images_cubit.dart';

import '../../../widgets/background_image.dart';
import '../widgets/gallery_grid.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ImagesCubit>(context).fetchImageData();
    return BlocBuilder<ImagesCubit, ImagesState>(
      builder: (context, state) {
        return state is ImagesLoading
            ? Stack(children: [
                Container(
                  decoration: BackgroundImage(isTransparent: true)
                      .backgroundDecoration(),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Gallery Loading...',
                          style: TextStyle(
                            color: SixxColors.secondary,
                            fontSize: 36,
                          )),
                      CircularProgressIndicator(
                        color: SixxColors.primary,
                      )
                    ],
                  ),
                ),
              ])
            : const GalleryGrid();
      },
    );
  }
}
