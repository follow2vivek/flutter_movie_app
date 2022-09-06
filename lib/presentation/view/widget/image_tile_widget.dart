import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageTileWidget extends StatelessWidget {
  final String imageUrl;
  final num? imageHeight;
  const ImageTileWidget({Key? key, required this.imageUrl,this.imageHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: imageUrl,
        fit: BoxFit.fill,
        height: imageHeight?.toDouble() ??  size.height * .18,
        width: size.width / 3,
      ),
    );
  }
}
