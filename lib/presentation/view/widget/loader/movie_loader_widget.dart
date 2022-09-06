import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MovieLoaderWidget extends StatelessWidget {
  const MovieLoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
      child: Container(
        height: size.height * .18,
        width: size.width / 3,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
