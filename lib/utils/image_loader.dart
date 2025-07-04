import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:user_manual/widgets/shimmer_loading.dart';

class ImageLoader extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  final bool isNetwork;
  const ImageLoader({super.key, required this.imagePath, required this.width, required this.height, this.isNetwork = false});

  @override
  Widget build(BuildContext context) {
    return isNetwork ? CachedNetworkImage(
      imageUrl: imagePath,
      width: width,
      height: height,
      placeholder: (context, url) => ShimmerLoading(width: width, height: height),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    ) : Padding(
      padding: EdgeInsets.zero,
      child: Image.asset(
        imagePath,
        width: width,
        height: height == 0 ? width - 50 : height,
        fit: BoxFit.contain,
      ),
    );
  }
}