import 'package:flutter/material.dart';
import 'package:user_manual/global/constant.dart';

class ImagePreloader {
  static final Set<String> _preloadedImages = <String>{};
  
  static Future<void> preloadVisibleImages(BuildContext context) async {
    const visibleImages = [
      'drawer_icon.png',
    ];

    final futures = <Future>[];
    
    for (final imagePath in visibleImages) {
      if (!_preloadedImages.contains(imagePath)) {
        futures.add(_preloadImage(context, imagePath));
      }
    }
    
    if (futures.isNotEmpty) {
      await Future.wait(futures);
    }
  }
  
  static Future<void> _preloadImage(BuildContext context, String imagePath) async {
    try {
      await precacheImage(AssetImage('assets/images/$imagePath'), context);
      _preloadedImages.add(imagePath);
    } catch (e) {
      // Ignore individual image preload failures
    }
  }
  
  static Future<void> preloadSectionImagesWhenNeeded(BuildContext context, String section) async {
    final sectionImages = _getSectionImages(section);
    
    final futures = <Future>[];
    for (final imagePath in sectionImages.take(3)) {
      if (!_preloadedImages.contains(imagePath)) {
        futures.add(_preloadImage(context, imagePath));
      }
    }
    
    if (futures.isNotEmpty) {
      await Future.wait(futures);
    }
  }
  
  static List<String> _getSectionImages(String section) {
    switch (section) {
      case 'spice':
        return [
          '${R.spice}spice1.png',
          '${R.spice}spice2.png',
          '${R.spice}spice3.png',
        ];
      case 'liquid':
        return [
          '${R.liquid}liquid1.png',
          '${R.liquid}liquid2.png',
          '${R.liquid}liquid3.png',
        ];
      case 'home':
        return [
          '${R.homeS3bucket}home1.png',
          '${R.homeS3bucket}home2.png',
        ];
      default:
        return [];
    }
  }
} 