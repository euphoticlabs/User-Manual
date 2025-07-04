import 'package:flutter/material.dart';
import 'package:user_manual/global/constant.dart';

class ImagePreloader {
  static final Set<String> _preloadedImages = <String>{};
  
  static Future<void> preloadCriticalImages(BuildContext context) async {
    const criticalImages = [
      '${R.homeS3bucket}home1.png',
      '${R.homeS3bucket}home2.png',
      '${R.knowYourNosh}knownosh1.png',
      '${R.knowYourNosh}knownosh2.png',
    ];

    final futures = <Future>[];
    
    for (final imagePath in criticalImages) {
      if (!_preloadedImages.contains(imagePath)) {
        futures.add(_preloadImage(context, imagePath));
      }
    }
    
    // Preload all images concurrently
    await Future.wait(futures);
  }
  
  static Future<void> _preloadImage(BuildContext context, String imagePath) async {
    try {
      await precacheImage(AssetImage('assets/images/$imagePath'), context);
      _preloadedImages.add(imagePath);
    } catch (e) {
      // Ignore individual image preload failures
    }
  }
  
  static void preloadSectionImages(BuildContext context, String section) {
    final sectionImages = _getSectionImages(section);
    
    for (final imagePath in sectionImages) {
      if (!_preloadedImages.contains(imagePath)) {
        _preloadImage(context, imagePath);
      }
    }
  }
  
  static List<String> _getSectionImages(String section) {
    switch (section) {
      case 'spice':
        return [
          '${R.spice}spice1.png',
          '${R.spice}spice2.png',
          '${R.spice}spice3.png',
          '${R.spice}spice4.png',
          '${R.spice}spice5.png',
          '${R.spice}spice6.png',
          '${R.spice}spice7.png',
        ];
      case 'liquid':
        return [
          '${R.liquid}liquid1.png',
          '${R.liquid}liquid2.png',
          '${R.liquid}liquid3.png',
          '${R.liquid}liquid4.png',
          '${R.liquid}liquid5.png',
          '${R.liquid}liquid6.png',
          '${R.liquid}liquid7.png',
          '${R.liquid}liquid8.png',
        ];
      case 'cleaning':
        return [
          '${R.dayTodayCleaning}daytoday1.png',
          '${R.dayTodayCleaning}daytoday2.png',
          '${R.dayTodayCleaning}daytoday3.png',
          '${R.dayTodayCleaning}daytoday4.png',
          '${R.dayTodayCleaning}daytoday5.png',
          '${R.monthlyCleaning}monthly1.png',
          '${R.monthlyCleaning}monthly2.png',
          '${R.monthlyCleaning}monthly3.png',
          '${R.monthlyCleaning}monthly4.png',
        ];
      default:
        return [];
    }
  }
} 