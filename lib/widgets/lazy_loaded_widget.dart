import 'package:flutter/material.dart';

class LazyLoadedWidget extends StatefulWidget {
  final Widget child;
  final bool isVisible;
  final Duration? delay;
  
  const LazyLoadedWidget({
    super.key,
    required this.child,
    required this.isVisible,
    this.delay,
  });

  @override
  State<LazyLoadedWidget> createState() => _LazyLoadedWidgetState();
}

class _LazyLoadedWidgetState extends State<LazyLoadedWidget> {
  bool _shouldBuild = false;
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.isVisible && !_shouldBuild && !_isLoading) {
      _isLoading = true;
      Future.delayed(widget.delay ?? const Duration(milliseconds: 100), () {
        if (mounted) {
          setState(() {
            _shouldBuild = true;
            _isLoading = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_shouldBuild) {
      return const SizedBox.shrink();
    }
    
    return widget.child;
  }
} 