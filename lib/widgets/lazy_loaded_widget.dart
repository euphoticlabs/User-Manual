import 'package:flutter/material.dart';
import 'package:user_manual/utils/image_preloader.dart';
import 'package:visibility_detector/visibility_detector.dart';

class LazyLoadedWidget extends StatefulWidget {
  final Widget child;
  final String? sectionType; // For targeted preloading
  
  const LazyLoadedWidget({
    super.key,
    required this.child,
    this.sectionType,
  });

  @override
  State<LazyLoadedWidget> createState() => _LazyLoadedWidgetState();
}

class _LazyLoadedWidgetState extends State<LazyLoadedWidget> {
  bool _isVisible = false;
  bool _hasPreloaded = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: widget.key ?? UniqueKey(),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_isVisible) {
          setState(() {
            _isVisible = true;
          });
          
          if (widget.sectionType != null && !_hasPreloaded) {
            _hasPreloaded = true;
            ImagePreloader.preloadSectionImagesWhenNeeded(
              context, 
              widget.sectionType!
            );
          }
        }
      },
      child: _isVisible ? widget.child : const SizedBox.shrink(),
    );
  }
} 