import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tripadvisor/constants.dart';

class ImageGallery extends StatelessWidget {
  const ImageGallery({super.key, required this.name, required this.imagePath});
  final String name;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left_rounded,
            size: 35,
          ),
        ),
        title: Text(
          name,
          maxLines: 2,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_a_photo_outlined,
            ),
          ),
          SizedBox(width: kDefaultPadding),
        ],
      ),
      body: MasonryGridView.builder(
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemCount: 10,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        itemBuilder: (context, index) {
          return ClipRect(
            child: Image.network('$imagePath&index=$index'),
          );
        },
      ),
    );
  }
}
