import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:user_manual/global/constant.dart';
import 'package:user_manual/widgets/shimmer_loading.dart';
import 'package:responsive_framework/responsive_framework.dart';

class KnowYourNoshDetailsWidget extends StatelessWidget {
  const KnowYourNoshDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Get responsive breakpoint
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    // Responsive text sizes
    final titleSize = isMobile ? 24.0 : isTablet ? 28.0 : 32.0;
    final stepTextWeight = isMobile ? FontWeight.w400 : FontWeight.w500;
    final screenWidth = MediaQuery.of(context).size.width;
    double stepTextSize = screenWidth < 500 ? 16 : 18;

    // Responsive image sizes
    final mainImageWidth = isMobile ? 300.0 : isTablet ? 400.0 : 500.0;
    final mainImageHeight = isMobile ? 250.0 : isTablet ? 350.0 : 400.0;
    
    // Responsive padding
    final horizontalPadding = isMobile ? 16.0 : isTablet ? 24.0 : 32.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Padding(
          padding: EdgeInsets.only(
            top: isMobile ? 50.0 : 70.0,
            left: horizontalPadding,
            bottom: 8.0,
          ),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              children: const [
                TextSpan(text: 'Know your '),
                TextSpan(
                  text: 'Nosh',
                  style: TextStyle(
                    color: Color(0xFFFF6B2C),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Main Image
        Center(
          child: CachedNetworkImage(
            imageUrl: '${R.knowYourNosh}knownosh1.png',
            width: mainImageWidth,
            height: mainImageHeight,
            fit: BoxFit.contain,
            placeholder: (context, url) => ShimmerLoading(
              width: mainImageWidth,
              height: mainImageHeight,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Calculate available width for the content
              final availableWidth = constraints.maxWidth;
              
              // For mobile, use a smaller image that fits
              final secondImageWidth = isMobile 
                  ? (availableWidth * 0.35).clamp(120.0, 200.0)  // 35% of available width, max 200px
                  : isTablet ? 250.0 : 300.0;
              final secondImageHeight = isMobile 
                  ? (secondImageWidth * 245 / 297.84)  // Maintain aspect ratio
                  : isTablet ? 250.0 : 300.0;
              
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      '''1. Spice lid
2. Spice Tray with c
3. 7 inch touchscreen display
4. Chimney filter
5. Chimney inlet vents
6. Ingredients tray
7. Eject button
8. Water container
9. Oil container
10. Stirrer
11. Pan
12. Door
13. Wooden legs
14. Induction
15. Back cover
16. Chimney duct
17. Top cover sheet''',
                      style: TextStyle(
                        fontSize: stepTextSize,
                        fontWeight: stepTextWeight,
                        height: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(width: isMobile ? 8.0 : 12.0),
                  SizedBox(
                    width: secondImageWidth,
                    child: CachedNetworkImage(
                      imageUrl: '${R.knowYourNosh}knownosh2.png',
                      width: secondImageWidth,
                      height: secondImageHeight,
                      placeholder: (context, url) => ShimmerLoading(
                        width: secondImageWidth,
                        height: secondImageHeight,
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
