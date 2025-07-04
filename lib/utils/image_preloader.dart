// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:user_manual/global/constant.dart';

// class ImagePreloader {
//   static final Set<String> _preloadedImages = <String>{};
  
//   static void preloadCriticalImages(BuildContext context) {
//     const criticalImages = [
//       '${R.homeS3bucket}home1.png',
//       '${R.homeS3bucket}home2.png',
//       '${R.knowYourNosh}knownosh1.png',
//     ];

//     for (final imageUrl in criticalImages) {
//       if (!_preloadedImages.contains(imageUrl)) {
//         precacheImage(CachedNetworkImageProvider(imageUrl), context);
//         _preloadedImages.add(imageUrl);
//       }
//     }
//   }
// } 